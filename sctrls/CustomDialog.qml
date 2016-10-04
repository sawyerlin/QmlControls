import QtQuick 2.4

FocusScope {
    property var currentItem: undefined
    id: self
    z: -1
    anchors.fill: parent
    Rectangle {
        anchors.fill: parent
        color: Qt.rgba(0, 0, 0, 0.7)
    }
    Keys.onReturnPressed: self.hide()
    function show(component) {
        self.z = 100;
        self.focus = true;
        self.currentItem = component.createObject(self, {
            closeCallback: function() {
                self.z = -1;
                if (self.currentItem) {
                    self.currentItem.destroy();
                }
            }
        });
    }
}
