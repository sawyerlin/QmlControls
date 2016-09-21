import QtQuick 2.4

FocusScope {
    property var fontSize: 20
    property var fontColor: "white"
    property var headerSize: fontSize + 10

    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: headerSize
    Item {
        focus: true
        id: item
        anchors.verticalCenter: parent.verticalCenter
        Text {
            id: text
            anchors.verticalCenter: parent.verticalCenter
            text: title
            color: fontColor
            font.pixelSize: fontSize
        }
        Image {
            anchors.left: text.right
            anchors.leftMargin: 10
            anchors.verticalCenter: text.verticalCenter
            source: "../images/ArrowRight-24.png"
        }
        transform: Scale {
            origin.x: item.width / 2
            origin.y: item.height / 2
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
    KeyNavigation.down: list
}
