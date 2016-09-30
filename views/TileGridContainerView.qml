import QtQuick 2.4

import "../lib"
import "../sctrls"
import "../datas"

PageView {
    TileGridView {
        anchors.fill: parent
        anchors.topMargin: 50 * hScale
        anchors.bottomMargin: 50 * hScale
        anchors.leftMargin: 100 * wScale
        anchors.rightMargin: 100 * wScale
        model: TileGridItems {}
    }
}
