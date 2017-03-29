import QtQuick 2.5

AnimateFocusScope {
    property var text: "item"
    property var color: "white"
    property var pixelSize: 32
    property var pixelFocusSize: 44

    id: self
    focus: true
    xScale: pixelFocusSize / pixelSize
    yScale: pixelFocusSize / pixelSize
    width: textView.width
    Text {
        id: textView
        color: self.color
        anchors.centerIn: parent
        font.pixelSize: self.pixelSize
        font.family: fontNormal.name
        text: self.text
    }
    Rectangle {
        visible: self.activeFocus
        anchors.top: textView.bottom
        anchors.topMargin: 5
        anchors.left: textView.left
        anchors.right: textView.right
        height: 3
        color: "#d3631f"
    }
}
