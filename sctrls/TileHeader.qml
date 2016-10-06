import QtQuick 2.4

FocusScope {
    property var fontSize: 30
    property var fontFocusSize: 39
    property var fontScale: fontFocusSize / fontSize
    property var title: undefined
    property var color: undefined

    id: self
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: fontSize + 50
    Item {
        focus: true
        id: item
        anchors.verticalCenter: parent.verticalCenter
        Text {
            id: text
            anchors.verticalCenter: parent.verticalCenter
            text: self.title || "title not defined"
            color: self.color || "white"
            font.pixelSize: fontSize
        }
        Image {
            visible: self.activeFocus
            anchors.left: text.right
            anchors.leftMargin: 10
            anchors.verticalCenter: text.verticalCenter
            source: "../images/ArrowRight-24.png"
        }
        transform: Scale {
            origin.x: item.width / 2
            origin.y: item.height / 2
            xScale: activeFocus ? fontScale : 1
            yScale: activeFocus ? fontScale : 1
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
