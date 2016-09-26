import QtQuick 2.4

Rectangle {
    property var avatar: "../images/User-50.png"
    property var animationDuration: 100
    property var sideSize: 153 * wScale
    property var sideFocusSize: 182 * wScale
    property var focusScale: sideFocusSize / sideSize

    id: self
    width: sideSize
    height: sideSize
    color: "black"
    Image {
        anchors.centerIn: parent
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
