import QtQuick 2.4

FocusScope {
    property var imageSource: "../images/Image-50.png"

    width: 80
    height: 80
    focus: true
    Rectangle {
        anchors.fill: parent
        color: "#414141"
        Image {
            anchors.centerIn: parent
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
