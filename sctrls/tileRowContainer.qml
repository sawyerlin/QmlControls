import QtQuick 2.4

FocusScope {
    property var currentModel: undefined
    property var itemSpacing: 10
    height: 133
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
            height: parent.height
        }
    }
}
