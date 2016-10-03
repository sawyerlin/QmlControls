import QtQuick 2.4

FocusScope {
    property var labelText: "filtre"
    property var contentText: "toutes"
    id: self
    width: 400 * wScale
    height: 60 * hScale
    Item {
        id: item
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: parent.right
        height: childrenRect.height
        Text {
            id: label
            font.pixelSize: 30 * hScale
            color: "#9C9C9C"
            text: self.labelText + " : "
            anchors.left: parent.left
        }
        Text {
            id: content
            font.pixelSize: 30 * hScale
            color: "white"
            text: self.contentText
            anchors.left: label.right
        }
        transform: Scale {
            origin.x: 0
            origin.y: item.height
            xScale: activeFocus ? 1.2 : 1
            yScale: activeFocus ? 1.2 : 1
        }
    }
    Triangle {
        type: "down"
        width: 18 * wScale
        height: 9 * hScale
        anchors.right: self.right
        anchors.verticalCenter: item.verticalCenter
    }
    Rectangle {
        anchors.bottom: self.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 2 * hScale
        color: "#393939"
    }
    
}
