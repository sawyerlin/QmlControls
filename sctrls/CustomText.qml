import QtQuick 2.4

AnimateFocusScope {
    property var fontColor: "#000000"
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
}
