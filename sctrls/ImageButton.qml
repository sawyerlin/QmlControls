import QtQuick 2.5
import QtGraphicalEffects 1.0

AnimateFocusScope {
    property var imageSource: "../images/Image-50.png"
    property var sideSize: 103
    property var sideFocusSize: 123
    property var focusScale: sideFocusSize / sideSize
    property var mode: ""
    property var color

    id: self
    width: sideSize
    height: sideSize
    xScale: focusScale
    yScale: focusScale
    RectangularGlow {
        anchors.fill: parent
        glowRadius: 10
        color: Qt.rgba(0, 0, 0, 0.2)
        cornerRadius: 0
    }
    Rectangle {
        id: rect
        anchors.fill: parent
        color: self.color || "#414141"
        Image {
            anchors.fill: imageSource && self.mode == "fill" ? parent : null
            anchors.centerIn: parent
            source: imageSource || "../images/Image-50.png"
        }
    }
    Rectangle {
        anchors.fill: parent
        border.width: 3
        border.color: "#d3631f"
        visible: self.activeFocus
        color: "transparent"
    }
}
