import QtQuick 2.5

FocusScope {
    property var fontSize: 40
    property var fontFocusSize: 52
    property var fontScale: fontFocusSize / fontSize
    property var title: undefined
    property var color: undefined

    id: self
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: 93
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
        Rectangle {
            visible: self.activeFocus
            anchors.top: text.bottom
            anchors.left: text.left
            anchors.right: text.right
            height: 3
            color: "#d3631f"
        }
    }
}
