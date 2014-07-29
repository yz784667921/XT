/*****************************************************************************************************************************************************************************
**
**
**
*****************************************************************************************************************************************************************************/
import QtQuick 1.1

Item {
    id: p1_zj_container_id
    width: 1024; height: 768

    //background pichture
    Image{
        id: p1_zj_background_id
        x: 0; y: 0; width:parent.width; height:parent.height
        source: "../image/p1_zj.jpg"
    }


    /*****************************************************************************************************************************************************************************
    **
    **system time area
    **
    *****************************************************************************************************************************************************************************/
    Rectangle{
        id:p1_zj_systime_area_id
        x: 0.08789*parent.width; y: 0*parent.height; width: 0.16016*parent.width; height: 0.09505*parent.height
        Image{
            id: p1_zj_systime_area_image_id
            anchors.fill: parent
            source: "../image/com_sj_bk.png"
        }

        Text {
            id: p1_zj_systime_area_text_id
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
        id:p1_zj_nextbutton_area_id
        x: 943
        y: 634
        //x: 941; y: 632; width:81; height:100
        width: 0.0791016*parent.width; height: 0.1302083*parent.height
        opacity: p1_zj_nextbutton_area_mousearea_id.containsMouse?0.1:1
        enabled: false

        Image{
            id: p1_zj_nextbutton_area_image_id
            anchors.fill: parent
            source: "../image/p1_zj_next_bt.png";
        }

        //next mousearea    
        MouseArea{
            id:p1_zj_nextbutton_area_mousearea_id
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                var component=Qt.createComponent("qrc:/qml/p2_abdj.qml").createObject(p0_kjh_container_id)
                //p1_zj_container_id.destroy();
                p1_zj_container_id.enabled=false;
                p1_zj_container_id.visible=false;
            }
        }
    }



    /*****************************************************************************************************************************************************************************
    **
    **zijian gou area
    **
    *****************************************************************************************************************************************************************************/
    Item{
        id:p1_zj_gou_area_id
        x: 8
        y: 258
        width:262; height:359

        Column{
            x:31; y:50
            spacing: 9

                Image{
                    id: p1_zj_gou_image_id
                    width: 42; height: 25;
                    source: "../image/p1_zj_gou.png";
                    visible: false
                }

                Image {
                    id: p1_zj_gou_image_id1
                    width: 42
                    height: 25
                    source: "../image/p1_zj_gou.png"
                    visible: false
                }

                Image {
                    id: p1_zj_gou_image_id2
                    width: 42
                    height: 25
                    source: "../image/p1_zj_gou.png"
                    visible: false
                }

                Image {
                    id: p1_zj_gou_image_id3
                    width: 42
                    height: 25
                    source: "../image/p1_zj_gou.png"
                    visible: false
                }

                Image {
                    id: p1_zj_gou_image_id4
                    width: 42
                    height: 25
                    source: "../image/p1_zj_gou.png"
                    visible: false
                }

                Image {
                    id: p1_zj_gou_image_id5
                    width: 42
                    height: 25
                    source: "../image/p1_zj_gou.png"
                    visible: false
                }

                Image {
                    id: p1_zj_gou_image_id6
                    width: 42
                    height: 25
                    source: "../image/p1_zj_gou.png"
                    visible: false
                }

                Image {
                    id: p1_zj_gou_image_id7
                    width: 42
                    height: 25
                    source: "../image/p1_zj_gou.png"
                    visible: false
                }

                Image {
                    id: p1_zj_gou_image_id8
                    width: 42
                    height: 25
                    source: "../image/p1_zj_gou.png"
                    visible: false
                }
        }
        //zijian  gou dingshi yici xian shi
        Timer {
            property int p1_zj_gou_tcount: 0
                id: p1_zj_gou_timer_id
                interval: 250; running: true; repeat: true
                onTriggered: {
                    switch(p1_zj_gou_tcount)
                    {
                        case 0:{p1_zj_gou_image_id.visible=true; p1_zj_gou_tcount++};break;
                        case 1:{p1_zj_gou_image_id1.visible=true; p1_zj_gou_tcount++};break;
                        case 2:{p1_zj_gou_image_id2.visible=true; p1_zj_gou_tcount++};break;
                        case 3:{p1_zj_gou_image_id3.visible=true; p1_zj_gou_tcount++};break;
                        case 4:{p1_zj_gou_image_id4.visible=true; p1_zj_gou_tcount++};break;
                        case 5:{p1_zj_gou_image_id5.visible=true; p1_zj_gou_tcount++};break;
                        case 6:{p1_zj_gou_image_id6.visible=true; p1_zj_gou_tcount++};break;
                        case 7:{p1_zj_gou_image_id7.visible=true; p1_zj_gou_tcount++};break;
                        case 8:{p1_zj_gou_image_id8.visible=true; p1_zj_gou_tcount++};break;
                        default:{stop();p1_zj_nextbutton_area_id.enabled=true}
                    }
                }
            }

    }









    /*****************************************************************************************************************************************************************************
    **
    **TEST
    **
    *****************************************************************************************************************************************************************************/
//    //data get test
//    Row{
//        spacing: 2
//        x: 300; y: 200;

//        Rectangle{
//            id:test_text_id
//            width: 150; height: 100
//            border.color: "green"
//            border.width: 10
//            color: "green"

//            Text {
//                id: data_text_id
//                anchors.centerIn: parent
//                font.bold: true; font.pixelSize: 25; color: "yellow"
//                text: "show data:";
//            }
//        }

//        Rectangle{
//            id:test_container_id
//            width: 300; height: 100
//            border.color: "green"
//            border.width: 10
//            color: "lightyellow"

//            Text {
//                id: data_test_id
//                anchors.centerIn: parent
//                font.bold: false; font.pixelSize: 17; color: "black"
//                text: mb.wendu;
//            }
//        }
//    }
//        //data set test
//        Row{
//            spacing: 2
//            x: 300; y: 315;

//            Rectangle{
//                id:set_test_text_id
//                width: 150; height: 100
//                border.color: "green"
//                border.width: 10
//                color: "green"

//                Text {
//                    id: set_data_text_id
//                    anchors.centerIn: parent
//                    font.bold: true; font.pixelSize: 25; color: "yellow"
//                    text: "set data:";
//                }
//            }

//            Rectangle{
//                id:set_test_container_id
//                width: 300; height: 100
//                border.color: "green"
//                border.width: 10
//                color: "lightyellow"

//                TextInput {
//                    id: set_data_test_id
////                    anchors.centerIn: parent
//                    anchors.left: parent.left; y: 5;
//                    anchors.right: parent.right
//                    color: focus?"black":"gray"
//                    focus: true
//                    font.pixelSize: 17
//                    validator: IntValidator{bottom:1; top:12;}
//                    //text: "Filed1"
//                    text:mb.status;

//                    onTextChanged: {
//                        mb.status=text;
//                    }

//                }

//                TextInput {
//                    id: set_data_test_id1
//                    anchors.left: parent.left; y: 50;
//                    anchors.right: parent.right
//                    color: focus?"black":"gray"
//                    focus: true
//                    font.pixelSize: 17
//                    text: "Filed2"
//                }
//            }

//    }
//        Rectangle{
//            id:queding_button_area_id
//             x: 772; y: 335; width: 190; height: 59
//             border.color: "green"
//             border.width: 51
//             color: "lightyellow"

//            Image{
//                id: queding_button_id
//                anchors.fill: parent
//                source: "../image/kaishitouxi_button.jpg"
//            }

//            MouseArea {
//                    id:queding_button_ma_id
//                    width: 190; height: 59
//                    anchors.centerIn: parent
//                    acceptedButtons: Qt.LeftButton | Qt.RightButton
//                    onClicked: {
//                        if (mouse.button === Qt.LeftButton)
//                        {
//                            parent.border.color = 'blue';
//                            mb.conf_status();
//                        }
//                        else
//                            parent.border.color = 'green';
//                    }
//                }
//        }
        /*****************************************************************************************************************************************************************************
        **
        **
        **
        *****************************************************************************************************************************************************************************/

}
