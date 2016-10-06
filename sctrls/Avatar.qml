import QtQuick 2.4

Rectangle {
    property var avatar: "../images/User-50.png"
    property var animationDuration: 100
    property var sideSize: 153
    property var sideFocusSize: 182
    property var focusScale: sideFocusSize / sideSize
    property var mode: "fill"

    id: self
    width: sideSize
    height: sideSize
    color: "black"
    Image {
        anchors.fill: self.mode == "fill" ? parent : null
        anchors.centerIn: self.mode == "fill" ? null: parent
        source: self.avatar
    }
    transform: Scale {
        origin.x: sideSize / 2
        origin.y: sideSize / 2
        xScale: activeFocus ? focusScale : 1
        yScale: activeFocus ? focusScale : 1
        Behavior on xScale {
            NumberAnimation {
                duration: animationDuration
            }
        }
        Behavior on yScale {
            NumberAnimation {
                duration: animationDuration
            }
        }
    }
}
