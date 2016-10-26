import QtQuick 2.5

import "../lib"
import "../sctrls"
import "../datas"

PageView {
    TileGridView {
        anchors.fill: parent
        focus: true
        anchors.topMargin: 50 
        anchors.bottomMargin: 50 
        anchors.leftMargin: 100 
        anchors.rightMargin: 100 
        model: TileGridItems {}
    }
}
