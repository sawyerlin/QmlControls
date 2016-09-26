import QtQuick 2.4

FocusScope {
    property var currentModel: undefined 
    property var itemSpacing: 30
    property var currentIndex: 0

    signal pressed(var datas)

    id: self
    height: 170 * hScale
    ListView {
        id: listView
        focus: true
        anchors.fill: parent
        highlightMoveDuration: 100
        spacing: itemSpacing
        orientation: ListView.Horizontal
        model: currentModel
        delegate: NavigationItem {
            height: parent.height
            itemValue: name 
            fontColor: isDefault ? "white" : "black"
            focus: isDefault
            Keys.onPressed: {
                if (event.key == Qt.Key_Return && !isDefault) {
                    pressed(datas)
                    currentModel.setProperty(self.currentIndex, "isDefault", false);
                    currentModel.setProperty(index, "isDefault", true);
                    self.currentIndex = index;
                }
            }
        }
        Component.onCompleted: {
            for (var index = 0; index < currentModel.count; index ++) {
                if (currentModel.get(index).isDefault) {
                    self.currentIndex = index;
                    break;
                }
            }
            listView.currentIndex = self.currentIndex
        }
    }
}
