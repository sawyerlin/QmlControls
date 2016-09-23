import QtQuick 2.4

import "sctrls"
import "datas"

FocusScope {
    width: 1280
    height: 720
    focus: true
    FocusScope {
        id: header
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 100
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
                currentModel: NavigationItems {}
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
