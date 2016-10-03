import QtQuick 2.4

FocusScope {
    property var callback: undefined
    id: self
    z: -1
    anchors.fill: parent
    Rectangle {
        anchors.fill: parent
        color: Qt.rgba(0, 0, 0, 0.7)
    }
    Keys.onReturnPressed: self.hide()
    function show(callback) {
        self.z = 100;
        self.focus = true;
        self.callback = callback;
    }
    function hide() {
        self.z = -1;
        if (self.callback) {
            self.callback();
        }
    }
}
