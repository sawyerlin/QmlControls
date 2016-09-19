import QtQuick 2.4

FocusScope {
    property var currentModel: undefined 
    property var itemSpacing: 30
    height: 40
    ListView {
        id: listView
        focus: true
        anchors.fill: parent
        highlightMoveDuration: 100
        spacing: itemSpacing
        orientation: ListView.Horizontal
        layoutDirection: Qt.LeftToRight
        model: currentModel
        delegate: NavigationItem {
            height: parent.height
            itemValue: name 
        }
    }
}
