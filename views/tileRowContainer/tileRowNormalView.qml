import QtQuick 2.4

import "../../sctrls"

TileRowContainer {
    id: container
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter
    currentIndex: 0
    currentModel: TileRowItems {}
}
