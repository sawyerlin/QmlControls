import QtQuick 2.5

FocusScope {
    property var model: undefined 
    property var itemSpacing: 100

    signal pressed(var datas)

    id: self
    ListView {
        id: listView
        focus: true
        anchors.fill: parent
        highlightMoveDuration: 100
        spacing: itemSpacing
        orientation: ListView.Horizontal
        model: self.model
        delegate: CustomText {
            text: name 
            pixelSize: 40
            pixelFocusSize: 52
            color: isDefault ? "white" : "#ff6600"
            Keys.onReturnPressed: {
                if (!isDefault) {
                    pressed(datas);
                    if (self.model.defaultIndex > -1) {
                        self.model.setProperty(self.model.defaultIndex, "isDefault", false);
                    }
                    self.model.setProperty(index, "isDefault", true);
                    self.model.defaultIndex = index;
                }
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
            pressed(currentModel.datas);
        }
    }
}
