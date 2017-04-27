import QtQuick 2.5

FocusScope {
    property var name
    property var color
    property var depth: 0
    property bool escapeEnabled: true
    property bool isFocusable: true
    property bool isReloadable: false
    property bool existedEnabled: false
    property bool isLoading: false

    id: self
    anchors.fill: parent
    focus: true
    Keys.onPressed: {
        if (event.key == Qt.Key_Back || event.key == Qt.Key_Escape) {
            event.accepted = true;
            if (self.escapeEnabled && !self.isLoading) {
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
    Component {
        id: loader
        FocusScope {
            property var closeCallback
            signal focusReleased()
            anchors.fill: parent
            Text {
                anchors.centerIn: parent
                color: "white"
                font.pixelSize: 26
                text: "Chargement..."
            }
            onFocusReleased: {
                var parent = self;
                restoreFocus(parent);
            }
            function restoreFocus(parent) {
                if (!parent.activeFocus) {
                    restoreFocus(parent.parent);
                    parent.focus = true;
                }
            }
        }
    }
    function close() {
        parent.pop();
    }
    function showLoader() {
        if (dialog) {
            self.isLoading = true;
            dialog.show(loader);
        }
    }
    function hideLoader() {
        if (dialog) {
            dialog.hide();
            self.isLoading = false;
        }
    }
}
