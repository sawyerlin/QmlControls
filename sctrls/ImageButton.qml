import QtQuick 2.5
import QtGraphicalEffects 1.0

AnimateFocusScopeLoader {
    property var imageSource: "../images/Image-50.png"
    property var sideSize: 103
    property var sideFocusSize: 123
    property var focusScale: sideFocusSize / sideSize
    property var mode: ""
    property int glowRadius: 10
    property var color

    id: self
    width: sideSize
    height: sideSize
    xScale: focusScale
    yScale: focusScale
    sourceComponent: RectangularGlow {
        anchors.fill: parent
        glowRadius: self.glowRadius
        color: Qt.rgba(0, 0, 0, 0.2)
        cornerRadius: 0
        Rectangle {
            anchors.fill: parent
            color: self.color || "#414141"
            Image {
                anchors.fill: imageSource && self.mode == "fill" ? parent : null
                anchors.centerIn: parent
                source: imageSource || "../images/Image-50.png"
            }
        }
    }
}
