import QtQuick 2.4

AnimateFocusScope {
    property var scale: 160 / 112
    id: self
    width: 112
    height: 112
    xScale: self.scale
    yScale: self.scale
    Rectangle {
        anchors.fill: parent
        width: 160
        height: 160
        color: Qt.rgba(0, 0, 0, 0.7)
        Triangle {
            type: "right"
            fill: false
            stroke: true
            width: 49
            height: 57
            anchors.centerIn: parent
            //anchors.top: parent.top
            //anchors.topMargin: 40
            //anchors.left: parent.left
            //anchors.leftMargin: 47
        }
    }
}
