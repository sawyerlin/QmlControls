import QtQuick 2.4

FocusScope {
    property var currentModel: undefined
    property var titleContent: "title is not defined"
    property var titleColor: "black"
    property var itemSpacing: 10
    property var displaySize: 5
    property var realDisplaySize: displaySize + 0.5
    property var fontSize: 20
    property var marginTop: 10

    id: self
    height: self.width / realDisplaySize / 16 * 9 + fontSize + marginTop
    focus: true
    Text {
        id: text
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        text: titleContent
        font.pixelSize: fontSize
        color: titleColor
    }
    ListView {
        focus: true
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: text.bottom
        anchors.topMargin: 10
        highlightMoveDuration: 100
        spacing: itemSpacing
        orientation: ListView.Horizontal
        layoutDirection: Qt.LeftToRight
        model: currentModel
        delegate: Tile {
            width: self.width / realDisplaySize
            height: width / 16 * 9
            titleContent: title
            descContent: desc
            backgroundContent: background
        }
    }
}
