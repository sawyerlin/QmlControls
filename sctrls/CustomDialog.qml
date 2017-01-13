import QtQuick 2.5

FocusScope {
    property var currentItem: undefined
    id: self
    z: -1
    anchors.fill: parent
    Rectangle {
        id: rect
        anchors.fill: parent
    }
    function show(component, colour) {
        colour = colour || Qt.rgba(0, 0, 0, 0.8)
        rect.color = colour;
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
