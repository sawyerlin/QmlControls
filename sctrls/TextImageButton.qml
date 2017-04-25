import QtQuick 2.5
import "."

ImageButton {
    property string text: ""

    id: self
    glowRadius: 0
    width: 200
    height: 80
    Text {
        anchors.top: parent.bottom
        anchors.topMargin: 10
        font.pixelSize: 23
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: fontNormal.name
        text: self.text
        color: "#999999"
    }
}

