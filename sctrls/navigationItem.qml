import QtQuick 2.4

FocusScope {
    property var fontColor: "#000000"
    property var itemValue: "item"

    width: text.width
    Text {
        id: text
        color: fontColor 
        anchors.centerIn: parent
        font.pixelSize: parent.height * 0.9 
        text: itemValue
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
