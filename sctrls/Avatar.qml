import QtQuick 2.5

AnimateFocusScope {
    property var avatar: undefined
    property var isEmpty: false
    property var sideSize: self.avatar.sideSize
    property var sideFocusSize: self.avatar.sideFocusSize
    property var focusScale:  sideFocusSize / sideSize

    id: self
    width: sideSize
    height: sideSize
    xScale: self.focusScale
    yScale: self.focusScale
    Rectangle {
        anchors.fill: parent
        visible: self.isEmpty
        color: "#3F3F3F"
    }
    Image {
        anchors.fill: self.isEmpty ? null : parent
        anchors.centerIn: parent
        source: self.isEmpty ? "../images/Add.png" : self.avatar.imageUrl
    }
}
