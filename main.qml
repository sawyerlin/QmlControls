import QtQuick 2.4

import "sctrls"
import "datas"

FocusScope {
    width: 1280
    height: 720
    focus: true
    NavigationContainer {
        id: navigationContainer
        focus: true
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        currentModel: NavigationItems {}
        KeyNavigation.down: tileRowContainer
    }
    TileRowContainer {
        id: tileRowContainer
        focus: true
        anchors.top: navigationContainer.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        currentModel: TileRowItems {}
        KeyNavigation.up: navigationContainer
        KeyNavigation.down: defaultButton
    }
    FocusScope {
        id: imageButtons
        anchors.top: tileRowContainer.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 100
        KeyNavigation.up: tileRowContainer
        Row {
            spacing: 50
            anchors.fill: parent
            ImageButton {
                id: defaultButton
                anchors.verticalCenter: parent.verticalCenter
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
                KeyNavigation.down: tileRowContainer
            }
        }
    }
    
}
