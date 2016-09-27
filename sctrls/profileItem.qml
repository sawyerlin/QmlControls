import QtQuick 2.4

FocusScope {
    property var profile: {
        id: -1
        name: "Nouveau Utilisateur"
        avatar: "../images/User-50.png"
        isChild: false
    }

    width: 200 * wScale
    height: 1 * hScale
    Avatar {
        id: avatarView
        focus: true
        anchors.horizontalCenter: parent.horizontalCenter
        avatar: profile.avatar
    }
    StyleText {
        anchors.top: avatarView.bottom
        anchors.topMargin: 30 * hScale
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 30 * wScale
        color: "white"
        text: profile.name
        font.bold: parent.activeFocus
    }
}
