import QtQuick 2.4

FocusScope {
    property var currentModel: undefined
    property var itemSpacing: 10
    property var displaySize: 5

    id: self
    height: self.width / 5.5 / 16 * 9
    ListView {
        focus: true
        anchors.fill: parent
        highlightMoveDuration: 100
        spacing: itemSpacing
        orientation: ListView.Horizontal
        layoutDirection: Qt.LeftToRight
        model: currentModel
        delegate: Tile {
            width: self.width / 5.5
            height: width / 16 * 9
        }
    }
}
