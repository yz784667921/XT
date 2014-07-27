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
        id: background_id
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
        x: 943; y: 632; width:81; height:100
        //x: 0.078*parent.width; y: 0.28*parent.height; width: 0.8457*parent.width; height: 0.0976*parent.height
        //opacity: 0.5
        //color: "yellow"
        //border.width:p1_zj_nextbutton_area_mousearea_id.containsMouse?3:0
        //border.color: p1_zj_nextbutton_area_mousearea_id.containsMouse?"lightgreen":"white"
        opacity: p1_zj_nextbutton_area_mousearea_id.containsMouse?0.0:1

        Image{
            id: p1_zj_nextbutton_area_image_id
            anchors.fill: parent
            source: "../image/p1_zj_next_bt.png";
            width:p1_zj_nextbutton_area_mousearea_id.containsMouse?50:81
            height:p1_zj_nextbutton_area_mousearea_id.containsMouse?60:100
        }

        //next mousearea    
        MouseArea{
            id:p1_zj_nextbutton_area_mousearea_id
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                var component=Qt.createComponent("qrc:/qml/p2_abdj.qml").createObject(p0_kjh_container_id)
                p1_zj_container_id.destroy();
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
