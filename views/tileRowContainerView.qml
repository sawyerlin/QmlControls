import QtQuick 2.4

import "../lib"
import "../sctrls"
import "../datas"

PageView {
    TileListView {
        id: container
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        currentModel: TileRowItems {}
    }
}
