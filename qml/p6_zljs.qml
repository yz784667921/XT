/*********************************************************************************************************************************************************************************
**
**
**
*********************************************************************************************************************************************************************************/
import QtQuick 1.1

Item {
    id: p6_zljs_container_id
    width: 1024; height: 768

    Item {
        id: p6_zljs_container_tk_id
        //x: (1024-415)/2; y: (768-251)/2; width: 451; height: 251
        x: parent.width*(1-0.4403)/2; y: parent.height*(1-0.326823)/2; width: 0.44043*parent.width; height: 0.326823*parent.height

        //background pichture
        Image{
            id: p6_zljs_background_id
            anchors.fill: parent
            source: "../image/p6_zljs.png"
            }

    }

}
