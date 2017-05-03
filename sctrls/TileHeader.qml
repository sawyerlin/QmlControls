import QtQuick 2.5

FocusScope {
    property var fontSize: 40
    property var fontFocusSize: 52
    property var fontScale: fontFocusSize / fontSize
    property var title
    property var color
    property bool noTitleFocus: false

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
            text: self.title
            color: self.color || "white"
            font.family: fontNormal.name
            font.pixelSize: fontSize
        }
        Text {
            id: textSide
            visible: !self.noTitleFocus
            anchors.left: text.right
            anchors.bottom: text.bottom
            anchors.bottomMargin: 2
            text: " - voir plus"
            color: "#636363"
            font.family: fontNormal.name
            font.pixelSize: 25
        }
        Rectangle {
            visible: self.activeFocus
            anchors.top: text.bottom
            anchors.left: text.left
            anchors.right: !self.noTitleFocus ? textSide.right : text.right
            height: 3
            color: "#d3631f"
        }
    }
}
