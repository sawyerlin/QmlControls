import QtQuick 2.4

FocusScope {
    property var model: undefined
    property var itemSpacing: 10
    property var displaySize: 5
    property var realDisplaySize: displaySize + 0.5

    id: self
    height: self.width / realDisplaySize / 16 * 9 + 30
    focus: true
    TileHeader {
        id: header
        focus: true
        title: model.title
        color: model.color || "white"
        KeyNavigation.down: list
    }
    ListView {
        id: list
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: header.bottom
        highlightMoveDuration: 100
        spacing: itemSpacing
        orientation: ListView.Horizontal
        layoutDirection: Qt.LeftToRight
        model: self.model
        delegate: Tile {
            width: self.width / realDisplaySize
            height: width / 16 * 9
            title: datas.title
            desc: datas.desc
            background: datas.background
            progressValue: datas.progressValue
            isParentFocused: self.activeFocus
        }
    }
}
