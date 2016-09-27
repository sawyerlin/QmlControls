import QtQuick 2.4

import "sctrls"
import "datas"

FocusScope {
    property var wScale: 1280 / 1920 
    property var hScale: 720 / 1080
    id: main
    width: 1280
    height: 720
    onWidthChanged: wScale = main.width / 1920;
    onHeightChanged: hScale = main.height / 1080
    focus: true
    FocusScope {
        id: header
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 200 * hScale
        focus: true
        Rectangle {
            color: "#555555"
            anchors.fill: parent
            NavigationContainer {
                focus: true
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 50
                anchors.verticalCenter: parent.verticalCenter
                model: NavigationItems {}
                onPressed: navigation.change(datas.type)
            }
        }
        KeyNavigation.down: navigation
    }
    Navigation {
        id: navigation
        focus: true
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }
}
