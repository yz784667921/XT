/*********************************************************************************************************************************************************************************
**
**
**
*********************************************************************************************************************************************************************************/
import QtQuick 1.1

Item {
    id: p2_abdj_container_id
    width: 1024; height: 768

    //background pichture
    Image{
        id: p2_abdj_background_id
        x: 0; y: 0; width:parent.width; height:parent.height
        source: "../image/p2_abdj.jpg"
        }



    /*****************************************************************************************************************************************************************************
    **
    **system time area
    **
    *****************************************************************************************************************************************************************************/
    Rectangle{
        id:p2_abdj_systime_area_id
        x: 0.08789*parent.width; y: 0*parent.height; width: 0.16016*parent.width; height: 0.09505*parent.height
        Image{
            id: p2_abdj_systime_area_image_id
            anchors.fill: parent
            source: "../image/com_sj_bk.png"
        }

        Text {
            id: p2_abdj_systime_area_text_id
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
        id:p2_abdj_nextbutton_area_id
        x: 953
        y: 651
        //x: 951; y: 649; width:71; height:83
        width: 0.069336*parent.width; height: 0.108073*parent.height
        opacity: p2_abdj_nextbutton_area_mousearea_id.containsMouse?0.1:1
        enabled: false

        BorderImage{
            id: p2_abdj_nextbutton_area_image_id
            anchors.fill: parent
            source: "../image/p2_abdj_next_bt.png";
        }

        //next mousearea
        MouseArea{
            id:p2_abdj_nextbutton_area_mousearea_id
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                var component=Qt.createComponent("qrc:/qml/p3_mnp.qml").createObject(p0_kjh_container_id)
                p2_abdj_container_id.enabled=false;
                p2_abdj_container_id.visible=false;
            }
        }
    }



    /*****************************************************************************************************************************************************************************
    **
    **cs area
    **
    *****************************************************************************************************************************************************************************/
    Item{
        id:p2_abdj_cs_area_id
        x: 0; y: 488; width:490; height:244
        //x: 0.92871*parent.width; y: 0.8450521*parent.height; width: 0.069336*parent.width; height: 0.108073*parent.height


        //touxiye cs button area
        Image{
            id: p2_abdj_cs_area_txy_image_id
            //x: 0; y: 31; width: 151; height: 205
            x: 0; y: 0.04036458*p2_abdj_container_id.height; width: 0.147461*p2_abdj_container_id.width; height: 0.26692708*p2_abdj_container_id.height
            source: "../image/p2_abdj_txy_bt.png";
            opacity: p2_abdj_cs_area_txy_image_mousearea_id.containsMouse?0.1:1

            MouseArea{
                    id:p2_abdj_cs_area_txy_image_mousearea_id
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        var component=Qt.createComponent("qrc:/qml/cs_txy.qml").createObject(p0_kjh_container_id)
                        p2_abdj_container_id.enabled=false
                    }
            }
        }

        //gansu cs button area
        Image{
            id: p2_abdj_cs_area_gs_image_id
            x: 166; y: 28; width: 150; height: 205
            //x: 165; y: 27; width: 0.147461*p2_abdj_container_id.width; height: 0.26692708*p2_abdj_container_id.height
            source: "../image/p2_abdj_gs_bt.png";
            opacity: p2_abdj_cs_area_gs_image_mousearea_id.containsMouse?0.1:1

            MouseArea{
                    id:p2_abdj_cs_area_gs_image_mousearea_id
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        var component=Qt.createComponent("qrc:/qml/cs_gs.qml").createObject(p0_kjh_container_id)
                        p2_abdj_container_id.enabled=false
                    }
            }
        }

        //yali cs button area
        Image{
            id: p2_abdj_cs_area_yl_image_id
            x: 336; y: 26; width: 150; height: 205
            //x: 165; y: 27; width: 0.147461*p2_abdj_container_id.width; height: 0.26692708*p2_abdj_container_id.height
            source: "../image/p2_abdj_yl_bt.png";
            opacity: p2_abdj_cs_area_yl_image_mousearea_id.containsMouse?0.1:1

            MouseArea{
                    id:p2_abdj_cs_area_yl_image_mousearea_id
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        var component=Qt.createComponent("qrc:/qml/cs_yl.qml").createObject(p0_kjh_container_id)
                        p2_abdj_container_id.enabled=false
                    }
            }
        }
    }



    /*****************************************************************************************************************************************************************************
    **
    **AB danjian wen ben shu ju cai ji area
    **
    *****************************************************************************************************************************************************************************/
    Item{
        id:p2_abdj_wbsjcj_area_id
        x: 490; y: 74; width:534; height:415

        //touxiye wendu
        Rectangle{
                    id:p2_abdj_wbsjcj_txwd_k_id
                    x: 149
                    y: 27
                    width: 70; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p2_abdj_wbsjcj_txwd_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //shuixiang wendu
        Rectangle{
                    id:p2_abdj_wbsjcj_sxwd_k_id
                    x: 149
                    y: 75
                    width: 70; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p2_abdj_wbsjcj_sxwd_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //xueye liuliang
        Rectangle{
                    id:p2_abdj_wbsjcj_xyll_k_id
                    x: 385
                    y: 27
                    width: 70; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p2_abdj_wbsjcj_xyll_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //xuebeng zhuangtai
        Rectangle{
                    id:p2_abdj_wbsjcj_xbzt_k_id
                    x: 385
                    y: 75
                    width: 70; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p2_abdj_wbsjcj_xbzt_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //Aye diandao
        Rectangle{
                    id:p2_abdj_wbsjcj_ay_k_id
                    x: 149
                    y: 152
                    width: 70; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p2_abdj_wbsjcj_ay_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //Bye diandao
        Rectangle{
                    id:p2_abdj_wbsjcj_by_k_id
                    x: 148
                    y: 202
                    width: 70; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p2_abdj_wbsjcj_by_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //zong diandao
        Rectangle{
                    id:p2_abdj_wbsjcj_zdd_k_id
                    x: 385
                    y: 151
                    width: 70; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p2_abdj_wbsjcj_zdd_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //touxi jinye liuliang
        Rectangle{
                    id:p2_abdj_wbsjcj_txj_k_id
                    x: 146
                    y: 285
                    width: 74; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p2_abdj_wbsjcj_txj_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //touxi chuye liuliang
        Rectangle{
                    id:p2_abdj_wbsjcj_txc_k_id
                    x: 146
                    y: 334
                    width: 74; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p2_abdj_wbsjcj_txc_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //jinye liuliang
        Rectangle{
                    id:p2_abdj_wbsjcj_jy_k_id
                    x: 384
                    y: 284
                    width: 74; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p2_abdj_wbsjcj_jy_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }
    }



    /*****************************************************************************************************************************************************************************
    **
    **AB danjian zhu zhuang tu area
    **
    *****************************************************************************************************************************************************************************/
    Item{
        id:p2_abdj_zzt_area_id
        x: 0; y: 74; width:490; height:415

        //wenben xianshi
        //xue ya wenbeng(jingmaiya)
        Rectangle{
                    id:p2_abdj_zzt_jmy_k_id
                    x: 99
                    y: 372
                    width: 75; height: 31
                    color: "red"

                    Text {
                        property real p2_abdj_zzt_xybar_rl: 0
                        id: p2_abdj_zzt_jmy_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "lightyellow"
                        text: "txt";

                        onTextChanged: {
                            p2_abdj_zzt_xybar_rl=parseFloat(text)
                            if(p2_abdj_zzt_xybar_rl>550){
                                p2_abdj_zzt_xybar_rl=550
                            }
                            else if(p2_abdj_zzt_xybar_rl<-150){
                                p2_abdj_zzt_xybar_rl=-150
                            }
                            else{
                                p2_abdj_zzt_xybar_rl=p2_abdj_zzt_xybar_rl
                            }
                            p2_abdj_zzt_xybar_id.height=(p2_abdj_zzt_xybar_rl+150)*313/700//--------------------------------when go into design need comment
                        }
                    }
                }

        //ye ya wenbeng
        Rectangle{
                    id:p2_abdj_zzt_ye_k_id
                    x: 295
                    y: 372
                    width: 75; height: 31
                    color: "blue"

                    Text {
                        property real p2_abdj_zzt_yebar_rl: 0
                        id: p2_abdj_zzt_ye_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "lightyellow"
                        text: "txt";

                        onTextChanged: {
                            p2_abdj_zzt_yebar_rl=parseFloat(text)
                            if(p2_abdj_zzt_yebar_rl>400){
                                p2_abdj_zzt_yebar_rl=400
                            }
                            else if(p2_abdj_zzt_yebar_rl<-300){
                                p2_abdj_zzt_yebar_rl=-300
                            }
                            else{
                                p2_abdj_zzt_yebar_rl=p2_abdj_zzt_yebar_rl
                            }
                            p2_abdj_zzt_yebar_id.height=(p2_abdj_zzt_yebar_rl+300)*313/700//--------------------------------when go into design need comment
                        }
                    }
                }

        //jindutiao xianshi
        //xueya bar
        Rectangle{
                    id:p2_abdj_zzt_xybar_id
                    x: 113
                    y:364-height
                    width: 45;
                    radius: 5
                    color: "red"
                }

        //yeya bar
        Rectangle{
                    id:p2_abdj_zzt_yebar_id
                    x: 309
                    y:364-height
                    width: 45;
                    radius: 5
                    color: "blue"
                }

        //test
                    Rectangle{
                        id:set_test_container_id0
                        x: 99; y: 410
                        width: 75; height: 31
                        border.color: "green"
                        border.width: 3
                        color: "lightyellow"

                        TextInput {
                            id: set_data_test_id0
                            anchors.centerIn: parent
                            color: focus?"black":"gray"
                            focus: true
                            font.pixelSize: 17
                            text: "1"

                            onTextChanged: {
                               p2_abdj_zzt_jmy_lbl_id.text=text
                               p2_abdj_zzt_ye_lbl_id.text=text
                            }
                        }
                    }
    }



    /*****************************************************************************************************************************************************************************
    **
    **AB danjian jin du tiao area
    **
    *****************************************************************************************************************************************************************************/
    Item{
        id:p2_abdj_jdt_area_id
        x: 490; y: 488; width:534; height:157

        Rectangle{
                    id:p2_abdj_jdt_id
                    x: 50
                    y: 64
                    height: 34
                    color: "gray"
                }

        Item{
            id:p2_abdj_jdt_text_area_id
            x:50
            y:64
            width: 445
            height: 34

            Text{
                id:p2_abdj_jdt_text_area_txt_id
                anchors.centerIn: parent
                color: "yellow"
                font.pixelSize: 18;
            }
        }

//--------------------------------when go into design need comment
        Timer {
                id:p2_abdj_jdt_timer_id
                interval: 10; running: true; repeat: true
                onTriggered: {
                    if(p2_abdj_jdt_id.width==445){
                        stop();
                        p2_abdj_nextbutton_area_id.enabled=true
                    }
                    else{
                        p2_abdj_jdt_text_area_txt_id.text=parseInt(p2_abdj_jdt_id.width*100/445+0.3)+"%"
                        p2_abdj_jdt_id.width++
                    }
                }
            }

    }

}
