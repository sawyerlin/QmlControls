import QtQuick 2.4

import "../lib"
import "../sctrls"
import "../datas"

PageView {
    ListView {
        id: listView
        focus: true
        spacing: 50
        anchors.left: parent.left
        anchors.leftMargin: 100
        anchors.right: parent.right
        anchors.rightMargin: 100
        anchors.verticalCenter: parent.verticalCenter
        highlightMoveDuration: 100
        orientation: ListView.Horizontal
        model: ProfileSelectorModel {}
        delegate: ProfileItem {
            profile: datas
            Component.onCompleted: {
                if (index == 0) {
                    listView.height = height
                }
            }
        }
    }
}
