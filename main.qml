import QtQuick 2.4

import "sctrls"
import "datas"

FocusScope {
    width: 1280
    height: 920
    focus: true
    id: self
    FocusScope {
        id: header
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 50 
        anchors.rightMargin: 50 
        height: 200
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
        anchors.top: parent.top
        anchors.topMargin: header.height
        width: 1920
        height: 1080
        transform: Scale {origin.x: 0; origin.y: 0; xScale: self.width / navigation.width; yScale: (self.height - header.height) / navigation.height;}
    }
    CustomDialog {
        id: dialog
    }
}
