import QtQuick 2.4

import "../lib"
import "../sctrls"
import "../datas"

PageView {
    FocusScope {
        focus: true
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        ListView {
            anchors.left: parent.left
            anchors.right: parent.right
            focus: true
            spacing: 50 * wScale
            highlightMoveDuration: 100
            orientation: ListView.Horizontal
            layoutDirection: Qt.LeftToRight
            model: ProfileSelectorModel {}
            delegate: ProfileItem {
                profile: datas
            }
        }
    }
}
