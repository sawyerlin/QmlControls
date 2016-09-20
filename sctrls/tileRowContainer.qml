import QtQuick 2.4

FocusScope {
    property var currentModel: undefined
    property var itemSpacing: 10
    property var displaySize: 5

    property var realDisplaySize: displaySize + 0.5

    id: self
    height: self.width / realDisplaySize / 16 * 9
    focus: true
    ListView {
        focus: true
        anchors.fill: parent
        highlightMoveDuration: 100
        spacing: itemSpacing
        orientation: ListView.Horizontal
        layoutDirection: Qt.LeftToRight
        model: currentModel
        delegate: Tile {
            width: self.width / realDisplaySize
            height: width / 16 * 9
        }
    }
}
