import QtQuick 2.4

AnimateFocusScope {
    property var fontColor: "#000000"
    property var text: "item"
    property var color: "white"
    property var pixelSize: 53

    id: self
    focus: true
    xScale: 1.1
    yScale: 1.1
    width: textView.width
    height: self.pixelSize
    Text {
        id: textView
        color: self.color
        anchors.centerIn: parent
        font.pixelSize: self.pixelSize
        text: self.text
    }
}
