import QtQuick 2.4

Rectangle {
    property int maximumValue: 100
    property var value: undefined
    property var visibleHeight: 0
    color: "#2F2F2F"
    height: value ? visibleHeight : 0
    Rectangle {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        color: "#FE5C27"
        width: Math.ceil(parent.width * value / maximumValue)
    }
}
