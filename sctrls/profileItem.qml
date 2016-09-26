import QtQuick 2.4

FocusScope {
    property var avatar: "../images/User-50.png"
    property var name: "Nouveau Utilisateur"

    id: self
    width: 200 * wScale
    height: 1 * hScale
    Avatar {
        id: avatarView
        focus: true
        anchors.horizontalCenter: parent.horizontalCenter
        avatar: self.avatar
    }
    StyleText {
        anchors.top: avatarView.bottom
        anchors.topMargin: 30 * hScale
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 30 * wScale
        color: "white"
        text: self.name
        font.bold: parent.activeFocus
    }
}
