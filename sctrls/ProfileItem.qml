import QtQuick 2.4

FocusScope {
    property var profile: undefined
    property var isEmpty: self.profile.id == undefined

    id: self
    width: avatarView.width
    height: childrenRect.height
    Avatar {
        id: avatarView
        avatar: profile.avatar.datas
        isEmpty: self.isEmpty
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Text {
        visible: profile.id != undefined
        anchors.top: avatarView.bottom
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 30
        color: "white"
        font.bold: parent.activeFocus
        text: self.isEmpty ? "" : profile.name
    }
}
