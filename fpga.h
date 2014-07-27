#ifndef FPGA_H
#define FPGA_H

#include <QObject>
#include <QTime>
#include <QDateTime>
#include <QTimer>

#include <stdio.h>
#include <stdlib.h>


class FPGA : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString systime READ getsystime WRITE setsystime NOTIFY systimeChanged)//system time
    Q_PROPERTY(QString wendu READ getwendu WRITE setwendu NOTIFY wenduChanged)//wendu
    Q_PROPERTY(QString status READ getstatus WRITE setstatus NOTIFY statusChanged)//status set

public:
    explicit FPGA(QObject *parent=0);
    ~FPGA();

    //user public parameter
    //TODO:add code here

    //user public function
    //TODO:add code here

    //system time
    QString getsystime(void) const;
    void setsystime(const QString& systime_set);

    //wendu
    QString getwendu(void) const;
    void setwendu(const QString& wendu_set);

    //status set
    QString getstatus(void) const;
    void setstatus(const QString& status_set);


    /*************************FPGA register***************************/
    //xuetouji base address declear
    uint8_t *xuelu_base;                //血路站
    uint8_t *yelu_base;                 //液路站
    uint8_t *abye_base;                 //AB站
    uint8_t *jiare_base;                //加热站
    uint8_t *anjian_base;               //安检站


    // xuetouji register address declear
    //血路站
    uint32_t *xuebengliuliang_set;      //血泵流量设定
    uint32_t *bengguan_set;             //泵管设定值
    uint32_t *xuebengqudongshuchu;      //血泵驱动输出
    uint32_t *jingmaiya;                //静脉压
    uint32_t *xuebenggaizhuangtai;      //血泵盖状态
    uint32_t *xuebengliuliang;          //血泵流量
    uint32_t *xueya_h;                  //血压上限
    uint32_t *xueya_l;                  //血压下限

    //液路站
    uint32_t *yeya_h;                       //液压上限
    uint32_t *yeya_l;                       //液压下限
    uint32_t *yeya;                         //液压
    uint32_t *touxiqijinyeliuliang;         //透析器进液流量
    uint32_t *touxiqichuyeliuliang;         //透析器出液流量
    uint32_t *chaolvlv;                     //超滤率
    uint32_t *chaolvlv_set;                 //超滤率设定值
    uint32_t *chaolvpidshuchu;              //差分超滤控制PID输出量
    uint32_t *chaolvbengkongzhiliangshuchu; //超滤泵（出液泵）控制量输出
    uint32_t *jinyeliuliang;                //进液流量
    uint32_t *jinyeliuliang_set;            //进液流量设定值
    uint32_t *jinyekongzhipidshuchuliang;   //进液控制PID输出量
    uint32_t *jinyebengkongzhiliangshuchu;  //进液泵控制量输出
    uint32_t *chaolvzongliang_set;          //超滤总量设定值
    uint32_t *chaolvzongshijian_set;        //超滤总时间设定值
    uint32_t *pid1_para_active;             //PID1参数 ACTIVE(bit0)
    uint32_t *pid1_para_mode;               //PID1参数 MODE(bit0)
    uint32_t *pid1_para_dr;                 //PID1参数 D_R(bit0)
    uint32_t *pid1_para_kp;                 //PID1参数 KP
    uint32_t *pid1_para_ki;                 //PID1参数 KI
    uint32_t *pid1_para_kd;                 //PID1参数 KD
    uint32_t *pid1_para_beta;               //PID1参数 BETA
    uint32_t *pid1_para_ul_l;               //PID1参数 UL_L
    uint32_t *pid1_para_ul_h;               //PID1参数 UL_H
    uint32_t *pid1_para_mov;                //PID1参数 MOV
    uint32_t *pid2_para_active;             //PID2参数 ACTIVE(bit0)
    uint32_t *pid2_para_mode;               //PID2参数 MODE(bit0)
    uint32_t *pid2_para_dr;                 //PID2参数 D_R(bit0)
    uint32_t *pid2_para_kp;                 //PID2参数 KP
    uint32_t *pid2_para_ki;                 //PID2参数 KI
    uint32_t *pid2_para_kd;                 //PID2参数 KD
    uint32_t *pid2_para_beta;               //PID2参数 BETA
    uint32_t *pid2_para_ul_l;               //PID2参数 UL_L
    uint32_t *pid2_para_ul_h;               //PID2参数 UL_H
    uint32_t *pid2_para_mov;                //PID2参数 MOV

    //AB站
    uint32_t *ayepeibizhi_set;              //A液配比值设定
    uint32_t *byepeibizhi_set;              //B液配比值设定
    uint32_t *abengkongzhishuchu;           //A泵控制输出
    uint32_t *bbengkongzhishuchu;           //B泵控制输出

    //加热站
    uint32_t *touxiyewendu_h;               //透析液温度上限
    uint32_t *touxiyewendu_l;               //透析液温度下限
    uint32_t *kongzhiwendu_set;             //控制温度设定值
    uint32_t *touxiyewendu;                 //透析液温度
    uint32_t *shuixiangwendu;               //水箱温度
    uint32_t *ads12471_para_reg0;           //ADS1247_1寄存器0x00
    uint32_t *ads12471_para_reg2;           //ADS1247_1寄存器0x02
    uint32_t *ads12471_para_reg3;           //ADS1247_1寄存器0x03
    uint32_t *ads12471_para_rega;           //ADS1247_1寄存器0x0a
    uint32_t *ads12471_para_regb;           //ADS1247_1寄存器0x0b
    uint32_t *ads12472_para_reg0;           //ADS1247_2寄存器0x00
    uint32_t *ads12472_para_reg2;           //ADS1247_2寄存器0x02
    uint32_t *ads12472_para_reg3;           //ADS1247_2寄存器0x03
    uint32_t *ads12472_para_rega;           //ADS1247_2寄存器0x0a
    uint32_t *ads12472_para_regb;           //ADS1247_2寄存器0x0b
    uint32_t *zhuhuanpidshuchukongzhiliang; //主环PID输出控制量
    uint32_t *pwmshineng;                   //PWM使能，bit0
    uint32_t *pwmzhouqi;                    //PWM周期
    uint32_t *pwmzhankongbi;                //PWM占空比输出，加热驱动控制
    uint32_t *pid_para_active;              //PID参数 ACTIVE(bit0)
    uint32_t *pid_para_mode;                //PID参数 MODE(bit0)
    uint32_t *pid_para_dr;                  //PID参数 D_R(bit0)
    uint32_t *pid_para_kp;                  //PID参数 KP
    uint32_t *pid_para_ki;                  //PID参数 KI
    uint32_t *pid_para_kd;                  //PID参数 KD
    uint32_t *pid_para_beta;                //PID参数 BETA
    uint32_t *pid_para_ul_l;                //PID参数 UL_L
    uint32_t *pid_para_ul_h;                //PID参数 UL_H
    uint32_t *pid_para_mov;                 //PID参数 MOV

    //按监站
    uint32_t *xitongzhuangtai;              //系统状态寄存器，bit[4:1],bit0
    uint32_t *baojing;                      //报警寄存器，bit[5:0]
    uint32_t *kuamoya;                      //跨膜压，计算结果
    uint32_t *kuamoya_h;                    //跨膜压上限
    uint32_t *kuamoya_l;                    //跨膜压下限


    // add flowing .......

    //工作方式定义
    static const  int zijian            =                   0x1;
    static const  int chengxuxuanze     =                   0x3;
    static const  int abdanjian         =                   0x4;
    static const  int monitouxipanglu   =                   0x5;
    static const  int monitouxizhulu    =                   0x6;
    static const  int touxi             =                   0x7;
    static const  int danchunchaolu     =                   0x8;
    static const  int panglu            =                   0x9;
    static const  int zhiliaojieshu     =                   0x10;
    static const  int huixue            =                   0x11;
    static const  int guanjipaikong     =                   0x12;

    //读写寄存器函数
    uint32_t getvalue(uint32_t *address);
    void setvalue(uint32_t *address, uint32_t value);

    //translate the work style
    uint32_t trans_gzfs(int gongzuofangshi);

    /**************************FPGA register end *******************************/


signals:
    //user signals
    //TODO:add code here

    //system time
    void systimeChanged(void);

    //wendu
    void wenduChanged(void);

    //status set
    void statusChanged(void);




public slots:
    //system time
    void updatetime();
 //   void scan_timer();

    //display update
    void updatedisplay();

    //configure status
    void conf_status();

private:
    void Init(void);
    int  fd;

    //TODO:add code here

    //systerm time
    QString get_time();
//    QTime current_time;
    QDateTime current_datetime;
    QString systimestring;
    QString m_systime;
    QTimer *scan_timer;

    //wendu
    QTimer *display_timer;
    QString m_wendu;

    //status set
    QString m_status;

};

#endif // FPGA_H
