/*********************************************************************************************************************************************************************************
**
**
**
*********************************************************************************************************************************************************************************/
import QtQuick 1.1

Item {
    id: p3_mnp_tk_container_id
    width: 1024; height: 768

    Item {
        id: p3_mnp_tk_container_tk_id
        //x: (1024-415)/2; y: (768-251)/2; width: 451; height: 251
        x: parent.width*(1-0.4403)/2; y: parent.height*(1-0.326823)/2; width: 0.44043*parent.width; height: 0.326823*parent.height

        //background pichture
        Image{
            id: p3_mnp_tk_background_id
            anchors.fill: parent
            source: "../image/p3_mnp_tk.png"
            }

        //monitouxizhu button area
        Image{
            id: p3_mnp_tk_mntxz_image_id
            x: 48; y: 184; width: 141; height: 37
            //x: 165; y: 27; width: 0.147461*p2_abdj_container_id.width; height: 0.26692708*p2_abdj_container_id.height
            source: "../image/p3_mnp_tk_mntxz_bt.png";
            opacity: p3_mnp_tk_mntxz_image_mousearea_id.containsMouse?0.1:1

            MouseArea{
                    id:p3_mnp_tk_mntxz_image_mousearea_id
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        var component=Qt.createComponent("qrc:/qml/p4_mnz.qml").createObject(p0_kjh_container_id)
                        p3_mnp_tk_container_id.enabled=false;
                    }
            }
        }

        //quxiao button area
        Image{
            id: p3_mnp_tk_qx_image_id
            x: 256; y: 184; width: 141; height: 37
            //x: 165; y: 27; width: 0.147461*p2_abdj_container_id.width; height: 0.26692708*p2_abdj_container_id.height
            source: "../image/p3_mnp_tk_qx_bt.png";
            opacity: p3_mnp_tk_qx_image_mousearea_id.containsMouse?0.1:1

            MouseArea{
                    id:p3_mnp_tk_qx_image_mousearea_id
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        //var component=Qt.createComponent("qrc:/qml/p2_abdj.qml").createObject(p0_kjh_container_id)
                        p3_mnp_tk_container_id.enabled=false;
                        p3_mnp_tk_container_id.visible=false;
                    }
            }
        }

    }

}
