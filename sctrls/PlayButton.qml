import QtQuick 2.5

AnimateFocusScope {
    property var scale: 160 / 112
    property var triangleWidth: 49
    property var triangleHeight: 57
    property bool showBorder: true

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
            width: self.triangleWidth
            height: self.triangleHeight
            anchors.centerIn: parent
        }
    }
    Rectangle {
        visible: self.showBorder && self.activeFocus
        anchors.fill: parent
        border.width: 3
        border.color: "#d3631f"
        color: "transparent"
    }
}
