import QtQuick 2.4

FocusScope {
    property var fontColor: "#000000"
    property var itemValue: "item"
    property var textSize: 53 * wScale

    width: text.width
    Text {
        id: text
        color: fontColor 
        anchors.centerIn: parent
        font.pixelSize: textSize
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
