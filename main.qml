import QtQuick 2.4

import "sctrls"
import "datas"

FocusScope {
    property var realWidth: 1920
    property var realHeight: 1080
    property var wScale: width / realWidth
    property var hScale: height / realHeight
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
        anchors.leftMargin: 50 * wScale
        anchors.rightMargin: 50 * wScale
        height: 200 * hScale
        focus: true
        FocusScope {
            focus: true
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
    CustomDialog {
        id: dialog
    }
}
