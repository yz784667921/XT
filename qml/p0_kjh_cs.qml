/*********************************************************
**
**
**
*********************************************************/
import QtQuick 1.1

Item {
    id: para_container_id
    width: 1024; height: 768

    //system time area
    Rectangle{
        id:para_page_id
        x: 0.25*parent.width; y: 0.25*parent.height; width: 512; height: 384
//        opacity: 0.5
        color: "lightgreen"
        border.width:5
        border.color: "darkblue"

        Text {
            id: text_id
            anchors.centerIn: parent
            font.bold: false; font.pixelSize: 17; color: "black"
            text: mb.systime;
        }

    }
}
