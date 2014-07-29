/*********************************************************
**
**
**
*********************************************************/
import QtQuick 1.1

Item {
    id: cs_gs_container_id
    width: 1024; height: 768

    //cs_txy_area
    Item{
        id:cs_gs_container_tk_id
        x: 256.5; y: 240.5; width:511; height:287
        //x: 0.92871*parent.width; y: 0.8450521*parent.height; width: 0.069336*parent.width; height: 0.108073*parent.height

        Image{
            id: cs_gs_container_tk_image_id
            anchors.fill: parent
            source: "../image/cs_gs.png";
        }
    }
}
