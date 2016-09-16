import QtQuick 2.4

FocusScope {
    property var imageSource: "../images/Image-50.png"

    width: 80
    height: 80
    Rectangle {
        anchors.fill: parent
        color: "#414141"
        Image {
            anchors.centerIn: parent
            source: imageSource
        }
    }
}
