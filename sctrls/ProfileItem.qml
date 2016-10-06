import QtQuick 2.4

FocusScope {
    property var profile: undefined

    width: avatarView.width
    height: childrenRect.height
    Avatar {
        id: avatarView
        focus: true
        anchors.horizontalCenter: parent.horizontalCenter
        avatar: profile.avatar
        mode: profile.id == undefined ? "center" : "fill"
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
