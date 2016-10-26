import QtQuick 2.5

FocusScope {
    property var model: undefined 
    property var itemSpacing: 100
    property var currentIndex: 0

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
            color: isDefault ? "white" : "black"
            focus: isDefault
            Keys.onReturnPressed: {
                if (!isDefault) {
                    pressed(datas);
                    self.model.setProperty(self.currentIndex, "isDefault", false);
                    self.model.setProperty(index, "isDefault", true);
                    self.currentIndex = index;
                }
            }
        }
        Component.onCompleted: {
            var currentModel;
            for (var index = 0; index < self.model.count; index ++) {
                currentModel = self.model.get(index);
                if (currentModel.isDefault) {
                    self.currentIndex = index;
                    break;
                }
            }
            listView.currentIndex = self.currentIndex
            pressed(currentModel.datas);
        }
    }
}
