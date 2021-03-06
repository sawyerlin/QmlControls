import QtQuick 2.5

FocusScope {
    property var model
    property var itemSpacing: 100

    signal pressed(var datas, bool isFirst)

    id: self
    ListView {
        id: listView
        focus: true
        anchors.fill: parent
        highlightMoveDuration: 300
        spacing: itemSpacing
        orientation: ListView.Horizontal
        model: self.model
        delegate: CustomText {
            text: name 
            pixelSize: 40
            pixelFocusSize: 52
            color: isDefault ? "white" : "#999999"
            Keys.onReturnPressed: {
                // comment if to fix the ticket: FV-98
                // if (!isDefault) {
                pressed(datas, false);
                if (self.model.defaultIndex > -1) {
                    self.model.setProperty(self.model.defaultIndex, "isDefault", false);
                }
                self.model.setProperty(index, "isDefault", true);
                self.model.defaultIndex = index;
                // }
            }
        }
        Component.onCompleted: {
            var currentModel;
            for (var index = 0; index < self.model.count; index ++) {
                currentModel = self.model.get(index);
                if (currentModel.isDefault) {
                    self.model.defaultIndex = index;
                    break;
                }
            }
            listView.currentIndex = self.model.defaultIndex;
            pressed(currentModel.datas, true);
        }
    }
    function reset() {
        self.focus = true;
        listView.currentIndex = self.model.defaultIndex;
    }
}
