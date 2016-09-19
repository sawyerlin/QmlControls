import QtQuick 2.4

FocusScope {
    width: 320
    height: 170
    focus: true
    Rectangle {
        focus: true
        anchors.fill: parent
        color: "blue"
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
