#include "fpga.h"
#include "stdio.h"
#include "unistd.h"
#include "fcntl.h"
#include "sys/mman.h"

#include "hwlib.h"
#include "socal/socal.h"
#include "hps_0.h"
#include "socal/alt_gpio.h"
#include "socal/socal.h"
#include "socal/hps.h"
#include <QTime>
#include <QString>


#define HW_REGS_BASE (ALT_STM_OFST)
#define HW_REGS_SPAN (0x04000000)
#define HW_REGS_MASK (HW_REGS_SPAN-1)


/******************************FPGA register define*******************************/
//血透机寄存器地址基地址定义
#define FPGA_XUELU_BASE     0X11000		//血路站
#define FPGA_YELU_BASE      0X12000		//液路站
#define FPGA_ABYE_BASE      0X13000		//AB站
#define FPGA_JIARE_BASE     0X14000		//加热站
#define FPGA_ANJIAN_BASE    0X15000		//安检站

//血透机寄存器地址偏移量定义
//血路站
#define xuebengliuliang_set_offset 		10	//血泵流量设定
#define bengguan_set_offset 			11	//泵管设定值
#define xuebengqudongshuchu_offset 		12	//血泵驱动输出
#define jingmaiya_offset				13	//静脉压
#define	xuebenggaizhuangtai_offset		14	//血泵盖状态
#define	xuebengliuliang_offset 			15	//血泵流量
#define	xueya_h_offset					16	//血压上限
#define	xueya_l_offset					17	//血压下限

//液路站
#define	yeya_h_offset                       10	//液压上限
#define yeya_l_offset                       11	//液压下限
#define	yeya_offset                         12	//液压
#define	touxiqijinyeliuliang_offset         13	//透析器进液流量
#define	touxiqichuyeliuliang_offset         14	//透析器出液流量
#define	chaolvlv_offset                     15	//超滤率
#define	chaolvlv_set_offset                 16	//超滤率设定值
#define	chaolvpidshuchu_offset              19	//差分超滤控制PID输出量
#define	chaolvbengkongzhiliangshuchu_offset	20	//超滤泵（出液泵）控制量输出
#define	jinyeliuliang_offset                21	//进液流量
#define	jinyeliuliang_set_offset            22	//进液流量设定值
#define	jinyekongzhipidshuchuliang_offset	25	//进液控制PID输出量
#define jinyebengkongzhiliangshuchu_offset	26	//进液泵控制量输出
#define	chaolvzongliang_set_offset			27	//超滤总量设定值
#define chaolvzongshijian_set_offset		28	//超滤总时间设定值
#define	pid1_para_active_offset				48	//PID1参数 ACTIVE(bit0)
#define	pid1_para_mode_offset				51	//PID1参数 MODE(bit0)
#define	pid1_para_dr_offset					52	//PID1参数 D_R(bit0)
#define	pid1_para_kp_offset					53	//PID1参数 KP
#define	pid1_para_ki_offset					54	//PID1参数 KI
#define	pid1_para_kd_offset					55	//PID1参数 KD
#define	pid1_para_beta_offset				56	//PID1参数 BETA
#define	pid1_para_ul_l_offset				57	//PID1参数 UL_L
#define	pid1_para_ul_h_offset				58	//PID1参数 UL_H
#define	pid1_para_mov_offset				59	//PID1参数 MOV
#define	pid2_para_active_offset				64	//PID2参数 ACTIVE(bit0)
#define	pid2_para_mode_offset				67	//PID2参数 MODE(bit0)
#define	pid2_para_dr_offset					68	//PID2参数 D_R(bit0)
#define	pid2_para_kp_offset					69	//PID2参数 KP
#define	pid2_para_ki_offset					70	//PID2参数 KI
#define	pid2_para_kd_offset					71	//PID2参数 KD
#define	pid2_para_beta_offset				72	//PID2参数 BETA
#define	pid2_para_ul_l_offset				73	//PID2参数 UL_L
#define	pid2_para_ul_h_offset				74	//PID2参数 UL_H
#define	pid2_para_mov_offset				75	//PID2参数 MOV

//AB站
#define	ayepeibizhi_set_offset				10	//A液配比值设定
#define	byepeibizhi_set_offset				11	//B液配比值设定
#define	abengkongzhishuchu_offset			12	//A泵控制输出
#define	bbengkongzhishuchu_offset			13	//B泵控制输出

//加热站
#define	touxiyewendu_h_offset				10	//透析液温度上限
#define	touxiyewendu_l_offset				11	//透析液温度下限
#define kongzhiwendu_set_offset				12	//控制温度设定值
#define	touxiyewendu_offset					13	//透析液温度
#define	shuixiangwendu_offset				14	//水箱温度
#define	ads12471_para_reg0_offset			16	//ADS1247_1寄存器0x00
#define	ads12471_para_reg2_offset			17	//ADS1247_1寄存器0x02
#define	ads12471_para_reg3_offset			18	//ADS1247_1寄存器0x03
#define	ads12471_para_rega_offset			19	//ADS1247_1寄存器0x0a
#define	ads12471_para_regb_offset			20	//ADS1247_1寄存器0x0b
#define	ads12472_para_reg0_offset			21	//ADS1247_2寄存器0x00
#define	ads12472_para_reg2_offset			22	//ADS1247_2寄存器0x02
#define	ads12472_para_reg3_offset			23	//ADS1247_2寄存器0x03
#define	ads12472_para_rega_offset			24	//ADS1247_2寄存器0x0a
#define	ads12472_para_regb_offset			25	//ADS1247_2寄存器0x0b
#define	zhuhuanpidshuchukongzhiliang_offset	39	//主环PID输出控制量
#define	pwmshineng_offset					48	//PWM使能，bit0
#define	pwmzhouqi_offset					49	//PWM周期
#define	pwmzhankongbi_offset				50	//PWM占空比输出，加热驱动控制
#define	pid_para_active_offset				64	//PID参数 ACTIVE(bit0)
#define	pid_para_mode_offset				67	//PID参数 MODE(bit0)
#define	pid_para_dr_offset					68	//PID参数 D_R(bit0)
#define	pid_para_kp_offset					69	//PID参数 KP
#define	pid_para_ki_offset					70	//PID参数 KI
#define	pid_para_kd_offset					71	//PID参数 KD
#define	pid_para_beta_offset				72	//PID参数 BETA
#define	pid_para_ul_l_offset				73	//PID参数 UL_L
#define	pid_para_ul_h_offset				74	//PID参数 UL_H
#define	pid_para_mov_offset                 75	//PID参数 MOV

//按监站
#define	xitongzhuangtai_offset				0 	//系统状态寄存器，bit[4:1],bit0
#define	baojing_offset						2 	//报警寄存器，bit[5:0]
#define	kuamoya_offset						10 	//跨膜压，计算结果
#define	kuamoya_h_offset					11	//跨膜压上限
#define	kuamoya_l_offset					12	//跨膜压下限

/******************************FPGA register define end*******************************/



/******************************Initial function****************************************/
FPGA::FPGA(QObject *parent):
QObject(parent),m_systime("no"),m_status("no data")
{
    Init();


    //system time
    scan_timer = new QTimer(this);
    connect(scan_timer,SIGNAL(timeout()),this,SLOT(updatetime()));
    scan_timer->start(1000);

    //display update
    display_timer=new QTimer(this);
    connect(display_timer,SIGNAL(timeout()),this,SLOT(updatedisplay()));
    display_timer->start(500);

}


/*********************************** function*********************************************/

/*********************system time**********************/
QString FPGA::get_time(void)
{
    //current_time=QTime::currentTime();
//    systimestring=current_time.toString(("hh:mm:ss"));
//    return systimestring;

    current_datetime=QDateTime::currentDateTime();
    systimestring=current_datetime.toString((" yyyy/MM/dd \nhh:mm:ss  AP"));
        return systimestring;
}
void FPGA::setsystime(const QString& systime_set)
{
    if(m_systime!=systime_set)
    {
        m_systime=systime_set;
        emit systimeChanged();
    }
}
QString FPGA::getsystime(void) const
{
    return m_systime;
}
void FPGA::updatetime()
{
    setsystime(get_time());
}

/*********************wendu**********************/
QString FPGA::getwendu(void) const
{
    return m_wendu;
}
void FPGA::setwendu(const QString& wendu_set)
{
    if(m_wendu!=wendu_set)
    {
        m_wendu=wendu_set;
        emit wenduChanged();
    }
}

/*********************status set**********************/
QString FPGA::getstatus(void) const
{
    return m_status;
}
void FPGA::setstatus(const QString& status_set)
{
    if(m_status!=status_set)
    {
        m_status=status_set;
        emit statusChanged();
    }
}

void FPGA::conf_status()
{
    //setvalue(xitongzhuangtai, getstatus().toULong());
    setvalue(xitongzhuangtai,trans_gzfs(getstatus().toULong()));
}

/*********************display refresh period 1s**********************/
void FPGA::updatedisplay()
{
    setwendu(QString::number(getvalue(xitongzhuangtai),10));
}

/***********************************FPGAself function*********************************************/
FPGA::~FPGA()
{
    close(fd);
}
void FPGA::Init()
{
    fd=open("/dev/mem",(O_RDWR | O_SYNC));
    if(fd!=-1)
    {
        void *virtual_base;
        virtual_base=mmap(NULL, HW_REGS_SPAN, (PROT_READ | PROT_WRITE), MAP_SHARED, fd, HW_REGS_BASE);
        if(virtual_base == MAP_FAILED){
            printf("ERROR:mmap() failed...\n");
            close(fd);
        }
        else{
            /***********************************FPGA address***************************/
            // m_led_base= (uint8_t *)virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + FPGA_LED_PIO_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
            xuelu_base= (uint8_t *)virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + FPGA_XUELU_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
            yelu_base= (uint8_t *)virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + FPGA_YELU_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
            abye_base= (uint8_t *)virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + FPGA_ABYE_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
            jiare_base= (uint8_t *)virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + FPGA_JIARE_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
            anjian_base= (uint8_t *)virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + FPGA_ANJIAN_BASE ) & ( unsigned long)( HW_REGS_MASK ) );

            //血透机寄存器地址定义
            //血路站
            xuebengliuliang_set=(uint32_t *)xuelu_base+xuebengliuliang_set_offset;          //血泵流量设定
            bengguan_set=(uint32_t *)xuelu_base+bengguan_set_offset;                        //泵管设定值
            xuebengqudongshuchu=(uint32_t *)xuelu_base+xuebengqudongshuchu_offset;          //血泵驱动输出
            jingmaiya=(uint32_t *)xuelu_base+jingmaiya_offset;                              //静脉压
            xuebenggaizhuangtai=(uint32_t *)xuelu_base+xuebenggaizhuangtai_offset;          //血泵盖状态
            xuebengliuliang=(uint32_t *)xuelu_base+xuebengliuliang_offset;                  //血泵流量
            xueya_h=(uint32_t *)xuelu_base+xueya_h_offset;                                  //血压上限
            xueya_l=(uint32_t *)xuelu_base+xueya_l_offset;                                  //血压下限
            //液路站
            yeya_h=(uint32_t *)yelu_base+yeya_h_offset;                                     //液压上限
            yeya_l=(uint32_t *)yelu_base+yeya_l_offset;                                     //液压下限
            yeya=(uint32_t *)yelu_base+yeya_offset;                                         //液压
            touxiqijinyeliuliang=(uint32_t *)yelu_base+touxiqijinyeliuliang_offset;         //透析器进液流量
            touxiqichuyeliuliang=(uint32_t *)yelu_base+touxiqichuyeliuliang_offset;         //透析器出液流量
            chaolvlv=(uint32_t *)yelu_base+chaolvlv_offset;                                 //超滤率
            chaolvlv_set=(uint32_t *)yelu_base+chaolvlv_set_offset;                         //超滤率设定值
            chaolvpidshuchu=(uint32_t *)yelu_base+chaolvpidshuchu_offset;                   //差分超滤控制PID输出量
            chaolvbengkongzhiliangshuchu=(uint32_t *)yelu_base+chaolvbengkongzhiliangshuchu_offset;     //超滤泵（出液泵）控制量输出
            jinyeliuliang=(uint32_t *)yelu_base+jinyeliuliang_offset;                                   //进液流量
            jinyeliuliang_set=(uint32_t *)yelu_base+jinyeliuliang_set_offset;                           //进液流量设定值
            jinyekongzhipidshuchuliang=(uint32_t *)yelu_base+jinyekongzhipidshuchuliang_offset;         //进液控制PID输出量
            jinyebengkongzhiliangshuchu=(uint32_t *)yelu_base+jinyebengkongzhiliangshuchu_offset;       //进液泵控制量输出
            chaolvzongliang_set=(uint32_t *)yelu_base+chaolvzongliang_set_offset;                       //超滤总量设定值
            chaolvzongshijian_set=(uint32_t *)yelu_base+chaolvzongshijian_set_offset;                   //超滤总时间设定值
            pid1_para_active=(uint32_t *)yelu_base+pid1_para_active_offset;                 //PID1参数 ACTIVE(bit0)
            pid1_para_mode=(uint32_t *)yelu_base+pid1_para_mode_offset;                     //PID1参数 MODE(bit0)
            pid1_para_dr=(uint32_t *)yelu_base+pid1_para_dr_offset;                         //PID1参数 D_R(bit0)
            pid1_para_kp=(uint32_t *)yelu_base+pid1_para_kp_offset;                         //PID1参数 KP
            pid1_para_ki=(uint32_t *)yelu_base+pid1_para_ki_offset;                         //PID1参数 KI
            pid1_para_kd=(uint32_t *)yelu_base+pid1_para_kd_offset;                         //PID1参数 KD
            pid1_para_beta=(uint32_t *)yelu_base+pid1_para_beta_offset;                     //PID1参数 BETA
            pid1_para_ul_l=(uint32_t *)yelu_base+pid1_para_ul_l_offset;                     //PID1参数 UL_L
            pid1_para_ul_h=(uint32_t *)yelu_base+pid1_para_ul_h_offset;                     //PID1参数 UL_H
            pid1_para_mov=(uint32_t *)yelu_base+pid1_para_mov_offset;                       //PID1参数 MOV
            pid2_para_active=(uint32_t *)yelu_base+pid2_para_active_offset;                 //PID2参数 ACTIVE(bit0)
            pid2_para_mode=(uint32_t *)yelu_base+pid2_para_mode_offset;                     //PID2参数 MODE(bit0)
            pid2_para_dr=(uint32_t *)yelu_base+pid2_para_dr_offset;                         //PID2参数 D_R(bit0)
            pid2_para_kp=(uint32_t *)yelu_base+pid2_para_kp_offset;                         //PID2参数 KP
            pid2_para_ki=(uint32_t *)yelu_base+pid2_para_ki_offset;                         //PID2参数 KI
            pid2_para_kd=(uint32_t *)yelu_base+pid2_para_kd_offset;                         //PID2参数 KD
            pid2_para_beta=(uint32_t *)yelu_base+pid2_para_beta_offset;                     //PID2参数 BETA
            pid2_para_ul_l=(uint32_t *)yelu_base+pid2_para_ul_l_offset;                     //PID2参数 UL_L
            pid2_para_ul_h=(uint32_t *)yelu_base+pid2_para_ul_h_offset;                     //PID2参数 UL_H
            pid2_para_mov=(uint32_t *)yelu_base+pid2_para_mov_offset;                       //PID2参数 MOV
            //AB站
            ayepeibizhi_set=(uint32_t *)abye_base+ayepeibizhi_set_offset;                   //A液配比值设定
            byepeibizhi_set=(uint32_t *)abye_base+byepeibizhi_set_offset;                   //B液配比值设定
            abengkongzhishuchu=(uint32_t *)abye_base+abengkongzhishuchu_offset;             //A泵控制输出
            bbengkongzhishuchu=(uint32_t *)abye_base+bbengkongzhishuchu_offset;             //B泵控制输出
            //加热站
            touxiyewendu_h=(uint32_t *)jiare_base+touxiyewendu_h_offset;                    //透析液温度上限
            touxiyewendu_l=(uint32_t *)jiare_base+touxiyewendu_l_offset;                    //透析液温度下限
            kongzhiwendu_set=(uint32_t *)jiare_base+kongzhiwendu_set_offset;                //控制温度设定值
            touxiyewendu=(uint32_t *)jiare_base+touxiyewendu_offset;                        //透析液温度
            shuixiangwendu=(uint32_t *)jiare_base+shuixiangwendu_offset;                    //水箱温度
            ads12471_para_reg0=(uint32_t *)jiare_base+ads12471_para_reg0_offset;             //ADS1247_1寄存器0x00
            ads12471_para_reg2=(uint32_t *)jiare_base+ads12471_para_reg2_offset;             //ADS1247_1寄存器0x02
            ads12471_para_reg3=(uint32_t *)jiare_base+ads12471_para_reg3_offset;             //ADS1247_1寄存器0x03
            ads12471_para_rega=(uint32_t *)jiare_base+ads12471_para_rega_offset;             //ADS1247_1寄存器0x0a
            ads12471_para_regb=(uint32_t *)jiare_base+ads12471_para_regb_offset;             //ADS1247_1寄存器0x0b
            ads12472_para_reg0=(uint32_t *)jiare_base+ads12472_para_reg0_offset;             //ADS1247_2寄存器0x00
            ads12472_para_reg2=(uint32_t *)jiare_base+ads12472_para_reg2_offset;             //ADS1247_2寄存器0x02
            ads12472_para_reg3=(uint32_t *)jiare_base+ads12472_para_reg3_offset;             //ADS1247_2寄存器0x03
            ads12472_para_rega=(uint32_t *)jiare_base+ads12472_para_rega_offset;             //ADS1247_2寄存器0x0a
            ads12472_para_regb=(uint32_t *)jiare_base+ads12472_para_regb_offset;             //ADS1247_2寄存器0x0b
            zhuhuanpidshuchukongzhiliang=(uint32_t *)jiare_base+zhuhuanpidshuchukongzhiliang_offset;    //主环PID输出控制量
            pwmshineng=(uint32_t *)jiare_base+pwmshineng_offset;                            //PWM使能，bit0
            pwmzhouqi=(uint32_t *)jiare_base+pwmzhouqi_offset;                              //PWM周期
            pwmzhankongbi=(uint32_t *)jiare_base+pwmzhankongbi_offset;                      //PWM占空比输出，加热驱动控制
            pid_para_active=(uint32_t *)jiare_base+pid_para_active_offset;                  //PID参数 ACTIVE(bit0)
            pid_para_mode=(uint32_t *)jiare_base+pid_para_mode_offset;                      //PID参数 MODE(bit0)
            pid_para_dr=(uint32_t *)jiare_base+pid_para_dr_offset;                          //PID参数 D_R(bit0)
            pid_para_kp=(uint32_t *)jiare_base+pid_para_kp_offset;                          //PID参数 KP
            pid_para_ki=(uint32_t *)jiare_base+pid_para_ki_offset;                          //PID参数 KI
            pid_para_kd=(uint32_t *)jiare_base+pid_para_kd_offset;                          //PID参数 KD
            pid_para_beta=(uint32_t *)jiare_base+pid_para_beta_offset;                      //PID参数 BETA
            pid_para_ul_l=(uint32_t *)jiare_base+pid_para_ul_l_offset;                      //PID参数 UL_L
            pid_para_ul_h=(uint32_t *)jiare_base+pid_para_ul_h_offset;                      //PID参数 UL_H
            pid_para_mov=(uint32_t *)jiare_base+pid_para_mov_offset;                        //PID参数 MOV
            //按监站
            xitongzhuangtai=(uint32_t *)anjian_base+xitongzhuangtai_offset;                 //系统状态寄存器，bit[4:1],bit0
            baojing=(uint32_t *)anjian_base+baojing_offset;                                 //报警寄存器，bit[5:0]
            kuamoya=(uint32_t *)anjian_base+kuamoya_offset;                                 //跨膜压，计算结果
            kuamoya_h=(uint32_t *)anjian_base+kuamoya_h_offset;                             //跨膜压上限
            kuamoya_l=(uint32_t *)anjian_base+kuamoya_l_offset;                             //跨膜压下限
        }
    close(fd);
    }
 //   close(fd);
}

/***************************FPGA function************************************/
uint32_t FPGA::getvalue(uint32_t *address)
{
    uint32_t res;
    res = *(address);
    return res;
}

void FPGA::setvalue(uint32_t *address, uint32_t value)
{
    *(address) = value;
}

uint32_t FPGA::trans_gzfs(int gongzuofangshi)
{
    uint32_t res;
    res=(getvalue(xitongzhuangtai)&0xffffffe1) | (gongzuofangshi<<1);
    return res;
}

