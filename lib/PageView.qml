import QtQuick 2.5

FocusScope {
    property var name
    property var color
    property var depth: 0
    property bool escapeEnabled: true
    property bool isFocusable: true
    property bool isReloadable: false

    id: self
    anchors.fill: parent
    focus: true
    Keys.onPressed: {
        if (event.key == Qt.Key_Back || event.key == Qt.Key_Escape) {
            event.accepted = true;
            if (self.escapeEnabled) {
                close();
            }
        }
    }
    onActiveFocusChanged: {
        if (activeFocus) {
            console.log(name + " is focused, depth: " + self.depth);
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
