import QtQuick 2.5

Rectangle {
    property bool showBorder: false

    id: self
    color: "#2F2F2F"
    width: 64
    height: 64
    z: 2
    Image {
        anchors.centerIn: parent
        source: "../images/Edit.png"
    }
    border.width: self.showBorder ? 3 : 0
    border.color: "#d3631f"
}
