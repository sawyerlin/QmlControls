import QtQuick 2.4

import "../datas"
import "../lib"
import "../sctrls"
import "tileRowContainer"

PageView {
    FocusScope {
        id: header
        focus: true
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 50
        KeyNavigation.down: navigation
        Rectangle {
            color: "#666666"
            anchors.fill: parent
            NavigationContainer {
                focus: true
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 50
                anchors.verticalCenter: parent.verticalCenter
                currentModel: SubNavigationItems {}
            }
        }
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
