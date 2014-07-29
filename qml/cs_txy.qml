/*********************************************************
**
**
**
*********************************************************/
import QtQuick 1.1

Item {
    id: cs_txy_container_id
    width: 1024; height: 768

    //cs_txy_area
    Item{
        id:cs_txy_container_tk_id
        x: 256.5; y: 200; width:511; height:368
        //x: 0.92871*parent.width; y: 0.8450521*parent.height; width: 0.069336*parent.width; height: 0.108073*parent.height

        Image{
            id: cs_txy_container_tk_image_id
            anchors.fill: parent
            source: "../image/cs_txy.png";
        }

        //queding button area
        Image{
            id: cs_txy_area_qd_image_id
            x: 57; y: 322; width: 133; height: 32
            //x: 165; y: 27; width: 0.147461*p2_abdj_container_id.width; height: 0.26692708*p2_abdj_container_id.height
            source: "../image/cs_txy_qd_bt.png";
            opacity: cs_txy_area_qd_image_mousearea_id.containsMouse?0.1:1

            MouseArea{
                    id:cs_txy_area_qd_image_mousearea_id
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        //var component=Qt.createComponent("qrc:/qml/p2_abdj.qml").createObject(p0_kjh_container_id)
                        cs_txy_container_id.destroy();
                        p2_abdj_container_id.enabled=true;
                    }
            }
        }

        //quxiao button area
        Image{
            id: cs_txy_area_qx_image_id
            x: 307; y: 324; width: 133; height: 32
            //x: 165; y: 27; width: 0.147461*p2_abdj_container_id.width; height: 0.26692708*p2_abdj_container_id.height
            source: "../image/cs_txy_qx_bt.png";
            opacity: cs_txy_area_qx_image_mousearea_id.containsMouse?0.1:1

            MouseArea{
                    id:cs_txy_area_qx_image_mousearea_id
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        //var component=Qt.createComponent("qrc:/qml/p2_abdj.qml").createObject(p0_kjh_container_id)
                        cs_txy_container_id.destroy();
                        p2_abdj_container_id.enabled=true;
                    }
            }
        }
    }
}
