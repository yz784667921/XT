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
        //x: 951; y: 650; width:71; height:83
        x: 0.92871*parent.width; y: 0.846354*parent.height; width: 0.069336*parent.width; height: 0.108073*parent.height
        opacity: p2_abdj_nextbutton_area_mousearea_id.containsMouse?0.0:1

        Image{
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
                p2_abdj_container_id.destroy();
            }
        }
    }

}
