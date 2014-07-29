/*********************************************************************************************************************************************************************************
**
**
**
*********************************************************************************************************************************************************************************/
import QtQuick 1.1

Item {
    id: p5_tx_container_id
    width: 1024; height: 768

    //background pichture
    Image{
        id: p5_tx_background_id
        x: 0; y: 0; width:parent.width; height:parent.height
        source: "../image/p5_tx.jpg"
        }


    /*****************************************************************************************************************************************************************************
    **
    **system time area
    **
    *****************************************************************************************************************************************************************************/
    Rectangle{
        id:p5_tx_systime_area_id
        x: 0.08789*parent.width; y: 0*parent.height; width: 0.16016*parent.width; height: 0.09505*parent.height
        Image{
            id: p5_tx_systime_area_image_id
            anchors.fill: parent
            source: "../image/com_sj_bk.png"
        }

        Text {
            id: p5_tx_systime_area_text_id
            anchors.centerIn: parent
            font.bold: false; font.pixelSize: 17; color: "black"
            text: mb.systime;
        }
    }



    /*****************************************************************************************************************************************************************************
    **
    **kaishitouxi button area
    **
    *****************************************************************************************************************************************************************************/
    Item{
        id:p5_tx_kstxbutton_area_id
        x: 825; y: 665; width:189; height:55
        //x: 0.92871*parent.width; y: 0.8450521*parent.height; width: 0.069336*parent.width; height: 0.108073*parent.height
        opacity: p5_tx_kstxbutton_area_mousearea_id.containsMouse?0.1:1

        Image{
            id: p5_tx_kstxbutton_area_image_id
            anchors.fill: parent
            source: "../image/p5_tx_kstx_bt.png";
        }

        //mousearea
        MouseArea{
            id:p5_tx_kstxbutton_area_mousearea_id
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
//                var component=Qt.createComponent("qrc:/qml/p6_zljs.qml").createObject(p0_kjh_container_id)
//                p5_tx_container_id.enabled=false;

                p5_tx_txsj_timer_id.interval=parseInt(p5_tx_txsjsd_txsj_edit_id.text)*1000
                p5_tx_txsj_timer_id.start()
                p5_tx_txsj_showupdate_timer_id.start()
                countDown.start();
            }
        }
    }



    /*****************************************************************************************************************************************************************************
    **
    **cs area
    **
    *****************************************************************************************************************************************************************************/
    Item{
        id:p5_tx_cs_area_id
        x: 0; y: 488; width:465; height:244
        //x: 0.92871*parent.width; y: 0.8450521*parent.height; width: 0.069336*parent.width; height: 0.108073*parent.height

        //touxiye cs button area
        Image{
            id: p5_tx_cs_area_txy_image_id
            //x: 0; y: 31; width: 151; height: 205
            x: 0; y: 31; width: 0.147461*p4_mnz_container_id.width; height: 0.26692708*p4_mnz_container_id.height
            source: "../image/p5_tx_txy_bt.png";
            opacity: p5_tx_cs_area_txy_image_mousearea_id.containsMouse?0.1:1

            MouseArea{
                    id:p5_tx_cs_area_txy_image_mousearea_id
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        var component=Qt.createComponent("qrc:/qml/cs_txy.qml").createObject(p0_kjh_container_id)
                        p5_tx_container_id.enabled=false
                    }
            }
        }

        //gansu cs button area
        Image{
            id: p5_tx_cs_area_gs_image_id
            x: 154; y: 28; width: 150; height: 205
            //x: 165; y: 27; width: 0.147461*p2_abdj_container_id.width; height: 0.26692708*p2_abdj_container_id.height
            source: "../image/p5_tx_gs_bt.png";
            opacity: p5_tx_cs_area_gs_image_mousearea_id.containsMouse?0.1:1

            MouseArea{
                    id:p5_tx_cs_area_gs_image_mousearea_id
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        var component=Qt.createComponent("qrc:/qml/cs_gs.qml").createObject(p0_kjh_container_id)
                        p5_tx_container_id.enabled=false
                    }
            }
        }

        //yali cs button area
        Image{
            id: p5_tx_cs_area_yl_image_id
            x: 308; y: 26; width: 150; height: 205
            //x: 165; y: 27; width: 0.147461*p2_abdj_container_id.width; height: 0.26692708*p2_abdj_container_id.height
            source: "../image/p5_tx_yl_bt.png";
            opacity: p5_tx_cs_area_yl_image_mousearea_id.containsMouse?0.1:1

            MouseArea{
                    id:p5_tx_cs_area_yl_image_mousearea_id
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        var component=Qt.createComponent("qrc:/qml/cs_yl.qml").createObject(p0_kjh_container_id)
                        p5_tx_container_id.enabled=false
                    }
            }
        }
    }



    /*****************************************************************************************************************************************************************************
    **
    **touxi wen ben shu ju cai ji area
    **
    *****************************************************************************************************************************************************************************/
    Item{
        id:p5_tx_wbsjcj_area_id
        x: 464; y: 74; width:560; height:415

        //touxiye wendu
        Rectangle{
                    id:p5_tx_wbsjcj_txwd_k_id
                    x: 145
                    y: 27
                    width: 70; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p5_tx_wbsjcj_txwd_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //shuixiang wendu
        Rectangle{
                    id:pp5_tx_wbsjcj_sxwd_k_id
                    x: 145
                    y: 75
                    width: 70; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p5_tx_wbsjcj_sxwd_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //xueye liuliang
        Rectangle{
                    id:p5_tx_wbsjcj_xyll_k_id
                    x: 413
                    y: 26
                    width: 70; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p5_tx_wbsjcj_xyll_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //xuebeng zhuangtai
        Rectangle{
                    id:p5_tx_wbsjcj_xbzt_k_id
                    x: 414
                    y: 73
                    width: 70; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p5_tx_wbsjcj_xbzt_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //Aye diandao
        Rectangle{
                    id:p5_tx_wbsjcj_ay_k_id
                    x: 145
                    y: 152
                    width: 70; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p5_tx_wbsjcj_ay_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //Bye diandao
        Rectangle{
                    id:p5_tx_wbsjcj_by_k_id
                    x: 146
                    y: 202
                    width: 70; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p5_tx_wbsjcj_by_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //zong diandao
        Rectangle{
                    id:p5_tx_wbsjcj_zdd_k_id
                    x: 415
                    y: 152
                    width: 70; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p5_tx_wbsjcj_zdd_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //touxi jinye liuliang
        Rectangle{
                    id:p5_tx_wbsjcj_txj_k_id
                    x: 414
                    y: 284
                    width: 70; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p5_tx_wbsjcj_txj_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //touxi chuye liuliang
        Rectangle{
                    id:p5_tx_wbsjcj_txc_k_id
                    x: 415
                    y: 329
                    width: 71; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p5_tx_wbsjcj_txc_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //jinye liuliang
        Rectangle{
                    id:p5_tx_wbsjcj_jy_k_id
                    x: 144
                    y: 284
                    width: 74; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p5_tx_wbsjcj_jy_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }

        //shishi chaolilv
        Rectangle{
                    id:p5_tx_wbsjcj_sscl_k_id
                    x: 144
                    y: 330
                    width: 74; height: 30
                    color: "#70e6e6"

                    Text {
                        id: p5_tx_wbsjcj_sscl_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "darkblue"
                        text: "txt";
                    }
                }
    }



    /*****************************************************************************************************************************************************************************
    **
    **touxi zhu zhuang tu area
    **
    *****************************************************************************************************************************************************************************/
    Item{
        id:p5_tx_zzt_area_id
        x: 0; y: 79; width:464; height:409

        //xue ya wenbeng(jingmaiya)
        Rectangle{
                    id:p5_tx_zzt_jmy_k_id
                    x: 52
                    y: 368
                    width: 75; height: 31
                    color: "red"

                    Text {
                        property real p5_tx_zzt_xybar_rl: 0
                        id: p5_tx_zzt_jmy_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "lightyellow"
                        text: "txt";

                        onTextChanged: {
                            p5_tx_zzt_xybar_rl=parseFloat(text)
                            if(p5_tx_zzt_xybar_rl>550){
                                p5_tx_zzt_xybar_rl=550
                            }
                            else if(p5_tx_zzt_xybar_rl<-150){
                                p5_tx_zzt_xybar_rl=-150
                            }
                            else{
                                p5_tx_zzt_xybar_rl=p5_tx_zzt_xybar_rl
                            }
                            p5_tx_zzt_xybar_id.height=(p5_tx_zzt_xybar_rl+150)*313/700//--------------------------------when go into design need comment
                        }
                    }
                }

        //ye ya wenbeng
        Rectangle{
                    id:p5_tx_zzt_ye_k_id
                    x: 189
                    y: 368
                    width: 75; height: 31
                    color: "blue"

                    Text {
                        property real p5_tx_zzt_yebar_rl: 0
                        id: p5_tx_zzt_ye_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "lightyellow"
                        text: "txt";

                        onTextChanged: {
                            p5_tx_zzt_yebar_rl=parseFloat(text)
                            if(p5_tx_zzt_yebar_rl>400){
                                p5_tx_zzt_yebar_rl=400
                            }
                            else if(p5_tx_zzt_yebar_rl<-300){
                                p5_tx_zzt_yebar_rl=-300
                            }
                            else{
                                p5_tx_zzt_yebar_rl=p5_tx_zzt_yebar_rl
                            }
                            p5_tx_zzt_yebar_id.height=(p5_tx_zzt_yebar_rl+300)*313/700//--------------------------------when go into design need comment
                        }
                    }
                }

        //kuamo ya wenbeng
        Rectangle{
                    id:p5_tx_zzt_kmy_k_id
                    x: 342
                    y: 366
                    width: 76; height: 32
                    color: "brown"

                    Text {
                        property real p5_tx_zzt_kmybar_rl: 0
                        id: p5_tx_zzt_kmy_lbl_id
                        anchors.centerIn: parent
                        font.pixelSize: 18; color: "lightyellow"
                        text: "txt";

                        onTextChanged: {
                            p5_tx_zzt_kmybar_rl=parseFloat(text)
                            if(p5_tx_zzt_kmybar_rl>550){
                                p5_tx_zzt_kmybar_rl=550
                            }
                            else if(p5_tx_zzt_kmybar_rl<-150){
                                p5_tx_zzt_kmybar_rl=-150
                            }
                            else{
                                p5_tx_zzt_kmybar_rl=p5_tx_zzt_kmybar_rl
                            }
                            p5_tx_zzt_kmybar_id.height=(p5_tx_zzt_kmybar_rl+150)*313/700//--------------------------------when go into design need comment
                        }
                    }
                }

        //jindutiao xianshi
        //xueya bar
        Rectangle{
                    id:p5_tx_zzt_xybar_id
                    x: 66
                    y:360-height
                    width: 45;
                    radius: 5
                    color: "red"
                }

        //yeya bar
        Rectangle{
                    id:p5_tx_zzt_yebar_id
                    x: 203
                    y:361-height
                    width: 45;
                    radius: 5
                    color: "blue"
                }

        //kuamoya bar
        Rectangle{
                    id:p5_tx_zzt_kmybar_id
                    x: 353
                    y:362-height
                    width: 45;
                    radius: 5
                    color: "brown"
                }


        //test
                    Rectangle{
                        id:set_test_container_id3
                        x: 99; y: 410
                        width: 75; height: 31
                        border.color: "#028000"
                        border.width: 3
                        color: "#ffffe1"

                        TextInput {
                            id: set_data_test_id3
                            anchors.centerIn: parent
                            color: focus?"black":"gray"
                            focus: true
                            font.pixelSize: 17
                            text: "1"
                            selectionColor: "#2f8fc5"

                            onTextChanged: {
                               p5_tx_zzt_jmy_lbl_id.text=text
                               p5_tx_zzt_ye_lbl_id.text=text
                                p5_tx_zzt_kmy_lbl_id.text=text
                            }
                        }
                    }
    }



    /*****************************************************************************************************************************************************************************
    **
    **touxi chaolv shijian area
    **
    *****************************************************************************************************************************************************************************/
    Item{
        id:p5_tx_clsj_area_id
        x: 816; y: 505; width:198; height:138

        //yi touxi shijian
        Rectangle{
                    id:p5_tx_clsj_ytxsj_k_id
                    x: 33
                    y: 66
                    width: 142; height: 58
                    color: "#70e6e6"

                    Text {
                        id: p5_tx_clsj_ytxsj_lbl_id
                        anchors.centerIn: parent
                        font.bold: true;font.pixelSize: 26; color: "yellow"
                        text: "01:26:15";
                    }
                }
    }



    /*****************************************************************************************************************************************************************************
    **
    **touxi touxishijian/chaolilv sheding area
    **
    *****************************************************************************************************************************************************************************/
    Item{
        id:p5_tx_txsjsd_area_id
        x: 479; y: 505; width:324; height:215

        //touxi shijian
        Rectangle{
                    id:p5_tx_txsjsd_txsj_k_id
                    x: 129
                    y: 67
                    width: 74; height: 30
                    //color: "#70e6e6"
                    color:p5_tx_txsjsd_txsj_edit_id.focus?"lightyellow":"#70e6e6"

                    TextInput {
                                id: p5_tx_txsjsd_txsj_edit_id
                                anchors.centerIn: parent
                                color: focus?"black":"gray"
                                focus: true
                                font.pixelSize: 18
                                validator: IntValidator{bottom:0; top:240;}
                                text: "5"
                                //text:mb.status;

                                onTextChanged: {
                                     //mb.status=text;
                                }
                    }
                }

        //chao li lv
        Rectangle{
                    id:p5_tx_txsjsd_cll_k_id
                    x: 129
                    y: 131
                    width: 74; height: 30
                    //color: "#70e6e6"
                    color:p5_tx_txsjsd_cll_edit_id.focus?"lightyellow":"#70e6e6"

                    TextInput {
                                id: p5_tx_txsjsd_cll_edit_id
                                anchors.centerIn: parent
                                color: focus?"black":"gray"
                                focus: true
                                font.pixelSize: 18
                                validator: IntValidator{bottom:0; top:4000;}
                                text: "Filed2"
                                //text:mb.status;

                                onTextChanged: {
                                    //mb.status=text;
                                }
                    }
                }
    }



    /*****************************************************************************************************************************************************************************
    **
    **touxi shijian timer
    **
    *****************************************************************************************************************************************************************************/
    Timer {
            id:p5_tx_txsj_timer_id
            //interval: 3000;
            running: false; repeat: false
            onTriggered: {
//                var component=Qt.createComponent("qrc:/qml/p6_zljs.qml").createObject(p0_kjh_container_id)
//                p5_tx_container_id.enabled=false;
                stop();
                p5_tx_txsj_showupdate_timer_id.stop();
            }
        }

    Timer {
            property int p5_tx_zzt_txsj_rl: 0
            id:p5_tx_txsj_showupdate_timer_id
            interval: 1000;running: false; repeat: true
            onTriggered: {
                p5_tx_zzt_txsj_rl++;
//                p5_tx_clsj_ytxsj_lbl_id.text=p5_tx_zzt_txsj_rl.toString(("hh:mm:ss"))
        }
    }



    //count test
            Rectangle {
                width: 320;
                height: 240;
                color: "gray";



                QtObject{
                    id: attrs;
                    property int counter;
                    Component.onCompleted:{
                        attrs.counter = 10;
                    }
                }

                Text {
                    id: countShow;
                    anchors.centerIn: parent;
                    color: "blue";
                    font.pixelSize: 40;
                }

                Timer {
                    id: countDown;
                    interval: 1000;
                    repeat: true;
                    triggeredOnStart: true;
                    onTriggered:{
                        countShow.text = attrs.counter
                        attrs.counter -= 1;
                        if(attrs.counter < 0)
                        {
                            countDown.stop();
                            countShow.text = "Clap Now!";
                        }
                    }
                }

            }
}
