import QtQuick 2.4
import QtGraphicalEffects 1.0

AnimateFocusScope {
    property var text: "undefine"

    id: self
    xScale: 1.1
    yScale: 1.1
    width: 419
    height: 84
    RectangularGlow {
        anchors.fill: parent
        glowRadius: 20
        spread: 0.1
        color: "#282828"
        cornerRadius: 0
    }
    Rectangle {
        anchors.fill: parent
        color: "#2B2B2B"
    }
    Text {
        anchors.centerIn: parent
        font.pixelSize: 28
        text: self.text
        color: "#999999"
    }
}
