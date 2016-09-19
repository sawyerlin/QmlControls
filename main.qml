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
        currentModel: ["item0", "item1", "item2", "item3", "item4", "item5", "item6", "item7"]
        KeyNavigation.down: defaultButton
    }
    Rectangle {
        anchors.top: navigationContainer.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 100
        color: "#aabbcc"
        KeyNavigation.up: navigationContainer
        Row {
            spacing: 50
            anchors.fill: parent
            ImageButton {
                id: defaultButton
                anchors.verticalCenter: parent.verticalCenter
                focus: true
                KeyNavigation.right: searchButton
            }
            ImageButton {
                id: searchButton
                anchors.verticalCenter: parent.verticalCenter
                imageSource: "../images/Search-50.png"
                KeyNavigation.left: defaultButton
                KeyNavigation.right: userButton
            }
            ImageButton {
                id: userButton
                anchors.verticalCenter: parent.verticalCenter
                imageSource: "../images/User-50.png"
                KeyNavigation.left: searchButton
            }
        }
    }
}
