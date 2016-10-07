import QtQuick 2.4

AnimateFocusScope {
    property var avatar: undefined
    property var animationDuration: 100
    property var sideSize: 153
    property var sideFocusSize: 182
    property var focusScale: sideFocusSize / sideSize
    property var mode: "fill"

    id: self
    width: sideSize
    height: sideSize
    xScale: sideFocusSize / sideSize
    yScale: sideFocusSize / sideSize
    Rectangle {
        anchors.fill: parent
        visible: self.mode != "fill"
        color: "#3F3F3F"
    }
    Image {
        anchors.fill: self.mode == "fill" ? parent : null
        anchors.centerIn: parent
        source: self.avatar
    }
}
