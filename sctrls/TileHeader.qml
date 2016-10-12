import QtQuick 2.4

FocusScope {
    property var fontSize: 40
    property var fontFocusSize: 39
    property var fontScale: fontFocusSize / fontSize
    property var title: undefined
    property var color: undefined

    id: self
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: fontSize + 50
    AnimateFocusScope {
        id: item
        xScale: fontScale
        yScale: fontScale
        focus: true
        anchors.verticalCenter: parent.verticalCenter
        Text {
            id: text
            anchors.verticalCenter: parent.verticalCenter
            text: self.title || "title not defined"
            color: self.color || "white"
            font.family: fontNormal.name
            font.pixelSize: fontSize
        }
        Image {
            visible: self.activeFocus
            anchors.left: text.right
            anchors.leftMargin: 10
            anchors.verticalCenter: text.verticalCenter
            source: "../images/ArrowRight-24.png"
        }
    }
}
