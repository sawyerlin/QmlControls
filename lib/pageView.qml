import QtQuick 2.5

FocusScope {
    property var name: null
    property var color
    property var exitEnabled: true

    id: self
    anchors.fill: parent
    focus: true
    Keys.onPressed: {
        if (self.exitEnabled && (event.key == Qt.Key_Back || event.key == Qt.Key_Backspace)) {
            event.accepted = true;
            close();
        }
    }
    onActiveFocusChanged: {
        if (activeFocus) {
            console.log(name + " is focused");
        }
    }
    Rectangle {
        anchors.fill: parent
        color: self.color || "#242424"
    }
    Text {
        id: emptyText
        anchors.centerIn: parent
        font.pixelSize: 50
        font.family: fontNormal.name
        color: "white"
        text: name
    }
    Component.onCompleted: {
        if (children.length > 2) {
            emptyText.visible = false;
        }
    }
    function close() {
        parent.pop();
    }
}
