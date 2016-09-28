import QtQuick 2.4
import QtGraphicalEffects 1.0

FocusScope {
    property var imageSource: "../images/Image-50.png"

    width: 80
    height: 80
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
            anchors.fill: parent
            source: imageSource
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
}
