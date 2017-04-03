import QtQuick 2.5

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
        width: avatarView.width
        elide: Text.ElideRight
        anchors.top: avatarView.bottom
        anchors.topMargin: 30
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 30
        color: "white"
        font.family: fontNormal.name
        font.weight: Font.ExtraBold
        text: self.isEmpty ? "" : profile.name
    }
}
