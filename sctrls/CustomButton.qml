import QtQuick 2.4
import QtGraphicalEffects 1.0

Rectangle {
    property var text: "undefine"

    RectangularGlow {
        anchors.fill: parent
        glowRadius: 20
        spread: 0.1
        color: "#282828"
        cornerRadius: 0
    }
    id: self
    color: "#2B2B2B"
    width: 419
    height: 84
    Text {
        anchors.centerIn: parent
        font.pixelSize: 28
        text: self.text
        color: "#999999"
    }
    transform: Scale {
        origin.x: width / 2
        origin.y: height / 2
        xScale: activeFocus ? 1.1 : 1
        yScale: activeFocus ? 1.1 : 1
        Behavior on xScale {
            NumberAnimation { 
                duration: 100 
            }
        }
        Behavior on yScale {
            NumberAnimation { 
                duration: 100 
            }
        }
    }
}
