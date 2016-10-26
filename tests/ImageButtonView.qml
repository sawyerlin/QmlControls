import QtQuick 2.5

import "../lib"
import "../sctrls"

PageView {
    Row {
        spacing: 50
        anchors.centerIn: parent
        ImageButton {
            id: defaultButton
            focus: true
            anchors.verticalCenter: parent.verticalCenter
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
        }
    }
}
