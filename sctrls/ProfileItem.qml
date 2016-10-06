import QtQuick 2.4

FocusScope {
    property var profile: undefined

    signal clicked(var profile)

    id: self
    width: avatarView.width
    height: childrenRect.height
    Avatar {
        id: avatarView
        focus: true
        anchors.horizontalCenter: parent.horizontalCenter
        avatar: profile.id == undefined ? "../images/Add.png" : profile.avatar
        mode: profile.id == undefined ? "center" : "fill"
    }
    Text {
        visible: profile.id != undefined
        anchors.top: avatarView.bottom
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 30
        color: "white"
        font.bold: parent.activeFocus
        text: profile.id == undefined ? "" : profile.name
    }
    Keys.onReturnPressed: self.clicked(self.profile)
}
