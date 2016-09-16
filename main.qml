import QtQuick 2.4

import "sctrls"

FocusScope {
    width: 1280
    height: 720
    focus: true
    NavigationContainer {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        focus: true
        height: 100
        backgroundColor: "#000000"
        currentModel: ["item0", "item1", "item2", "item3", "item4", "item5", "item6", "item7"]
    }
}
