import QtQuick 2.4
import QtGraphicalEffects 1.0

AnimateFocusScope {
    property var imageSource: "../images/Image-50.png"
    property var sideSize: 103
    property var sideFocusSize: 123
    property var focusScale: sideFocusSize / sideSize
    property var mode: ""

    id: self
    width: sideSize
    height: sideSize
    xScale: focusScale
    yScale: focusScale
    RectangularGlow {
        id: effect
        anchors.fill: rect
        glowRadius: 20
        spread: 0.1
        color: "#282828"
        cornerRadius: 0
    }
    Rectangle {
        id: rect
        anchors.fill: parent
        color: "#414141"
        Image {
            anchors.fill: imageSource && self.mode == "fill" ? parent : null
            anchors.centerIn: parent
            source: imageSource || "../images/Image-50.png"
        }
    }
}
