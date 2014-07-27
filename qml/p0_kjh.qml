/*********************************************************************************************************************************************************************************
**
**
**
*********************************************************************************************************************************************************************************/
import QtQuick 1.1

Item {
    id: p0_kjh_container_id
    width: 1024; height: 768

    //background pichture
    Image{
        id: p0_kjh_background_id
        x: 0; y: 0; width:parent.width; height:parent.height
        source: "../image/p0_kjh.jpg"
        }


    /*****************************************************************************************************************************************************************************
    **
    **parameter setting area
    **
    *****************************************************************************************************************************************************************************/
    Rectangle{
        id:p0_kjh_csset_area_id
        x: 0.085*parent.width; y: 0.0755*parent.height; width: 0.0605*parent.width; height: 0.0605*parent.width; radius: 0.0303*parent.width;
        color: "yellow"
        border.width:p0_kjh_csset_area_mousearea_id.containsMouse?4:0
        border.color: p0_kjh_csset_area_mousearea_id.containsMouse?"lightgreen":"white"
        opacity: p0_kjh_csset_area_mousearea_id.containsMouse?0.3:1

        Image{
            id: p0_kjh_csset_area_image_id
            x: -1; y: -1; width:parent.width+2; height:parent.height+2
            source: "../image/p0_kjh_cs_bt.gif"
        }

        //parameter setting mousearea
        MouseArea{
            id:p0_kjh_csset_area_mousearea_id
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                var component=Qt.createComponent("qrc:/qml/p0_kjh_cs.qml").createObject(p0_kjh_container_id)
                p0_kjh_container_id.enabled=false
            }
            }
     }


    /*****************************************************************************************************************************************************************************
    **
    **input system button area
    **
    *****************************************************************************************************************************************************************************/
    Rectangle{
        id:p0_kjh_insysbutton_area_id
        x: 0.078*parent.width; y: 0.28*parent.height; width: 0.8457*parent.width; height: 0.0976*parent.height
        //opacity: 0.5
        color: "yellow"
        border.width:p0_kjh_insysbutton_area_mousearea_id.containsMouse?3:0
        border.color: p0_kjh_insysbutton_area_mousearea_id.containsMouse?"lightgreen":"white"
        opacity: p0_kjh_insysbutton_area_mousearea_id.containsMouse?0.3:1

        Image{
            id: p0_kjh_insysbutton_area_image_id
            anchors.fill: parent
            source: "../image/p0_kjh_insys_bt.jpg";
        }

        //parameter setting mousearea
        MouseArea{
            id:p0_kjh_insysbutton_area_mousearea_id
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                var component=Qt.createComponent("qrc:/qml/p1_zj.qml").createObject(p0_kjh_container_id)
                //p0_kjh_container_id.destroy();
            }
        }
    }

}
