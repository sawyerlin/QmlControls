import QtQuick 2.4

import "../lib"
import "../sctrls"
import "../datas"

PageView {
    TileGridView {
        anchors.fill: parent
        anchors.topMargin: 50 
        anchors.bottomMargin: 50 
        anchors.leftMargin: 100 
        anchors.rightMargin: 100 
        model: TileGridItems {}
    }
}
