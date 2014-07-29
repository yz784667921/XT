/*********************************************************************************************************************************************************************************
**
**
**
*********************************************************************************************************************************************************************************/
import QtQuick 1.1

Item {
    id: p3_mnp_container_id
    width: 1024; height: 768

    //background pichture
    Image{
        id: p3_mnp_background_id
        x: 0; y: 0; width:parent.width; height:parent.height
        source: "../image/p3_mnp.jpg"
        }


    /*****************************************************************************************************************************************************************************
    **
    **system time area
    **
    *****************************************************************************************************************************************************************************/
    Rectangle{
        id:p3_mnp_systime_area_id
        x: 0.08789*parent.width; y: 0*parent.height; width: 0.16016*parent.width; height: 0.09505*parent.height
        Image{
            id: p3_mnp_systime_area_image_id
            anchors.fill: parent
            source: "../image/com_sj_bk.png"
        }

        Text {
            id: p3_mnp_systime_area_text_id
            anchors.centerIn: parent
            font.bold: false; font.pixelSize: 17; color: "black"
            text: mb.systime;
        }
    }



    /*****************************************************************************************************************************************************************************
    **
    **next button area
    **
    *****************************************************************************************************************************************************************************/
    Item{
        id:p3_mnp_nextbutton_area_id
        x: 954; y: 664; width:70; height:69
        //x: 0.92871*parent.width; y: 0.8450521*parent.height; width: 0.069336*parent.width; height: 0.108073*parent.height
        opacity: p3_mnp_nextbutton_area_mousearea_id.containsMouse?0.1:1

        Image{
            id: p3_mnp_nextbutton_area_image_id
            anchors.fill: parent
            source: "../image/p3_mnp_next_bt.png";
        }

        //next mousearea
        MouseArea{
            id:p3_mnp_nextbutton_area_mousearea_id
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                var component=Qt.createComponent("qrc:/qml/p3_mnp_tk.qml").createObject(p0_kjh_container_id)
                p3_mnp_container_id.enabled=false;
            }
        }
    }



    /*****************************************************************************************************************************************************************************
    **
    **cs area
    **
    *****************************************************************************************************************************************************************************/
    Item{
        id:p3_mnp_cs_area_id
        x: 0; y: 488; width:490; height:244
        //x: 0.92871*parent.width; y: 0.8450521*parent.height; width: 0.069336*parent.width; height: 0.108073*parent.height


        //touxiye cs button area
        Image{
            id: p3_mnp_cs_area_txy_image_id
            //x: 0; y: 31; width: 151; height: 205
            x: 0; y: 0.04036458*p3_mnp_container_id.height; width: 0.147461*p3_mnp_container_id.width; height: 0.26692708*p3_mnp_container_id.height
            source: "../image/p3_mnp_txy_bt.png";
            opacity: p3_mnp_cs_area_txy_image_mousearea_id.containsMouse?0.1:1

            MouseArea{
                    id:p3_mnp_cs_area_txy_image_mousearea_id
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        var component=Qt.createComponent("qrc:/qml/cs_txy.qml").createObject(p0_kjh_container_id)
                        p3_mnp_container_id.enabled=false
                    }
            }
        }

        //gansu cs button area
        Image{
            id: p3_mnp_cs_area_gs_image_id
            x: 166; y: 28; width: 150; height: 205
            //x: 165; y: 27; width: 0.147461*p2_abdj_container_id.width; height: 0.26692708*p2_abdj_container_id.height
            source: "../image/p3_mnp_gs_bt.png";
            opacity: p3_mnp_cs_area_gs_image_mousearea_id.containsMouse?0.1:1

            MouseArea{
                    id:p3_mnp_cs_area_gs_image_mousearea_id
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        var component=Qt.createComponent("qrc:/qml/cs_gs.qml").createObject(p0_kjh_container_id)
                        p3_mnp_container_id.enabled=false
                    }
            }
        }

        //yali cs button area
        Image{
            id: p3_mnp_cs_area_yl_image_id
            x: 336; y: 26; width: 150; height: 205
            //x: 165; y: 27; width: 0.147461*p2_abdj_container_id.width; height: 0.26692708*p2_abdj_container_id.height
            source: "../image/p3_mnp_yl_bt.png";
            opacity: p3_mnp_cs_area_yl_image_mousearea_id.containsMouse?0.1:1

            MouseArea{
                    id:p3_mnp_cs_area_yl_image_mousearea_id
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        var component=Qt.createComponent("qrc:/qml/cs_yl.qml").createObject(p0_kjh_container_id)
                        p3_mnp_container_id.enabled=false
                    }
            }
        }
    }



    /*****************************************************************************************************************************************************************************
    **
    **moni touxi panglu wen ben shu ju cai ji area
    **
    *****************************************************************************************************************************************************************************/
    Item{
        id:p3_mnp_wbsjcj_area_id
        x: 490; y: 74; width:534; height:361

        //touxiye wendu
        Rectangle{
                    id:p3_mnp_wbsjcj_txwd_k_id
                    x: 149
                    y: 27
                    width: 70; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p3_mnp_wbsjcj_txwd_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //shuixiang wendu
        Rectangle{
                    id:p3_mnp_wbsjcj_sxwd_k_id
                    x: 149
                    y: 75
                    width: 70; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p3_mnp_wbsjcj_sxwd_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //xueye liuliang
        Rectangle{
                    id:p3_mnp_wbsjcj_xyll_k_id
                    x: 385
                    y: 27
                    width: 70; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p3_mnp_wbsjcj_xyll_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //xuebeng zhuangtai
        Rectangle{
                    id:p3_mnp_wbsjcj_xbzt_k_id
                    x: 385
                    y: 75
                    width: 70; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p3_mnp_wbsjcj_xbzt_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //Aye diandao
        Rectangle{
                    id:p3_mnp_wbsjcj_ay_k_id
                    x: 149
                    y: 139
                    width: 70; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p3_mnp_wbsjcj_ay_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //Bye diandao
        Rectangle{
                    id:p3_mnp_wbsjcj_by_k_id
                    x: 148
                    y: 189
                    width: 70; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p3_mnp_wbsjcj_by_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //zong diandao
        Rectangle{
                    id:p3_mnp_wbsjcj_zdd_k_id
                    x: 385
                    y: 137
                    width: 70; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p3_mnp_wbsjcj_zdd_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //touxi jinye liuliang
        Rectangle{
                    id:p3_mnp_wbsjcj_txj_k_id
                    x: 146
                    y: 261
                    width: 74; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p3_mnp_wbsjcj_txj_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //touxi chuye liuliang
        Rectangle{
                    id:p3_mnp_wbsjcj_txc_k_id
                    x: 146
                    y: 310
                    width: 74; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p3_mnp_wbsjcj_txc_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //jinye liuliang
        Rectangle{
                    id:p3_mnp_wbsjcj_jy_k_id
                    x: 384
                    y: 260
                    width: 74; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p3_mnp_wbsjcj_jy_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }
    }



    /*****************************************************************************************************************************************************************************
    **
    **moni touxi panglu zhu zhuang tu area
    **
    *****************************************************************************************************************************************************************************/
    Item{
        id:p3_mnp_zzt_area_id
        x: 0; y: 74; width:490; height:415

        //xue ya wenbeng(jingmaiya)
        Rectangle{
                    id:p3_mnp_zzt_jmy_k_id
                    x: 99
                    y: 372
                    width: 75; height: 31
                    color: "red"

                    Text {
                        property real p3_mnp_zzt_xybar_rl: 0
                        id: p3_mnp_zzt_jmy_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "lightyellow"
                        text: "txt";

                        onTextChanged: {
                            p3_mnp_zzt_xybar_rl=parseFloat(text)
                            if(p3_mnp_zzt_xybar_rl>550){
                                p3_mnp_zzt_xybar_rl=550
                            }
                            else if(p3_mnp_zzt_xybar_rl<-150){
                                p3_mnp_zzt_xybar_rl=-150
                            }
                            else{
                                p3_mnp_zzt_xybar_rl=p3_mnp_zzt_xybar_rl
                            }
                            p3_mnp_zzt_xybar_id.height=(p3_mnp_zzt_xybar_rl+150)*313/700//--------------------------------when go into design need comment
                        }
                    }
                }

        //ye ya wenbeng
        Rectangle{
                    id:p3_mnp_zzt_ye_k_id
                    x: 295
                    y: 372
                    width: 75; height: 31
                    color: "blue"

                    Text {
                        property real p3_mnp_zzt_yebar_rl: 0
                        id: p3_mnp_zzt_ye_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "lightyellow"
                        text: "txt";

                        onTextChanged: {
                            p3_mnp_zzt_yebar_rl=parseFloat(text)
                            if(p3_mnp_zzt_yebar_rl>400){
                                p3_mnp_zzt_yebar_rl=400
                            }
                            else if(p3_mnp_zzt_yebar_rl<-300){
                                p3_mnp_zzt_yebar_rl=-300
                            }
                            else{
                                p3_mnp_zzt_yebar_rl=p3_mnp_zzt_yebar_rl
                            }
                            p3_mnp_zzt_yebar_id.height=(p3_mnp_zzt_yebar_rl+300)*313/700//--------------------------------when go into design need comment
                        }
                    }
                }

        //jindutiao xianshi
        //xueya bar
        Rectangle{
                    id:p3_mnp_zzt_xybar_id
                    x: 113
                    y:364-height
                    width: 45;
                    radius: 5
                    color: "red"
                }

        //yeya bar
        Rectangle{
                    id:p3_mnp_zzt_yebar_id
                    x: 309
                    y:365-height
                    width: 45;
                    radius: 5
                    color: "blue"
                }


        //test
                    Rectangle{
                        id:set_test_container_id1
                        x: 99; y: 410
                        width: 75; height: 31
                        border.color: "green"
                        border.width: 3
                        color: "lightyellow"

                        TextInput {
                            id: set_data_test_id1
                            anchors.centerIn: parent
                            color: focus?"black":"gray"
                            focus: true
                            font.pixelSize: 17
                            text: "1"

                            onTextChanged: {
                               p3_mnp_zzt_jmy_lbl_id.text=text
                               p3_mnp_zzt_ye_lbl_id.text=text
                            }
                        }
                    }
    }



    /*****************************************************************************************************************************************************************************
    **
    **moni touxi panglu dingshi go into next page timer
    **
    *****************************************************************************************************************************************************************************/
    Timer {
            id:p3_mnp_gotonextpage_timer_id
            interval: 3000; running: true; repeat: true
            onTriggered: {
                var component=Qt.createComponent("qrc:/qml/p3_mnp_tk.qml").createObject(p0_kjh_container_id)
                p3_mnp_container_id.enabled=false;
                stop();
            }
        }

}
