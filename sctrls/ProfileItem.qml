import QtQuick 2.4

FocusScope {
    property var profile: {
        id: -1
        name: "Nouveau Utilisateur"
        avatar: "../images/User-50.png"
        isChild: false
    }

    width: avatarView.width
    height: childrenRect.height
    Avatar {
        id: avatarView
        focus: true
        anchors.horizontalCenter: parent.horizontalCenter
        avatar: profile.avatar
    }
    Text {
        anchors.top: avatarView.bottom
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 30
        color: "white"
        font.bold: parent.activeFocus
        text: profile.name
    }
}
