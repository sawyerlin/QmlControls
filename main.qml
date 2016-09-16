import QtQuick 2.4

import "sctrls"

FocusScope {
    width: 1280
    height: 720
    focus: true
    NavigationContainer {
        id: navigationContainer
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 100
        backgroundColor: "#000000"
        focus: true
        currentModel: ["item0", "item1", "item2", "item3", "item4", "item5", "item6", "item7"]
    }
    Rectangle {
        anchors.top: navigationContainer.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 100
        color: "#aabbcc"
        Row {
            spacing: 10
            anchors.fill: parent
            ImageButton {
                anchors.verticalCenter: parent.verticalCenter
            }
            ImageButton {
                anchors.verticalCenter: parent.verticalCenter
                imageSource: "../images/Search-50.png"
            }
            ImageButton {
                anchors.verticalCenter: parent.verticalCenter
                imageSource: "../images/User-50.png"
            }
        }
    }
}
