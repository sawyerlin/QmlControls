import QtQuick 2.4

FocusScope {
    property var model: undefined
    property var labelText: "item"
    property var titleText: "choix d'un item"
    property var contentText: "undefined"

    signal opened(var component)
    signal selected(var datas)

    id: self
    focus: true
    width: 323
    height: 54
    Component.onCompleted: {
        var currentItem = self.model.get(self.currentIndex);
        if (currentItem) {
            self.contentText = currentItem.datas.name;
        }
    }
    AnimateFocusScope {
        id: item
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: parent.right
        height: childrenRect.height
        xOrigin: 0
        xScale: 1.1
        yScale: 1.1
        Text {
            id: label
            font.pixelSize: 25
            color: "#9C9C9C"
            font.family: fontNormal.name
            text: self.labelText + " : "
            anchors.left: parent.left
        }
        Text {
            id: content
            font.pixelSize: 25
            font.family: fontNormal.name
            color: "white"
            text: self.contentText
            anchors.left: label.right
        }
    }
    Triangle {
        type: "down"
        width: 18
        height: 9
        anchors.right: self.right
        anchors.verticalCenter: item.verticalCenter
    }
    Rectangle {
        anchors.bottom: self.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 2
        color: "#393939"
    }
    Keys.onReturnPressed: opened(dropdownlist)
    Component {
        id: dropdownlist
        DropDownListContent {
            anchors.fill: parent
            titleText: self.titleText
            currentIndex: self.model ? self.model.selectedIndex : 0
            model: self.model 
            onSelected: {
                if (datas) {
                    self.contentText = datas.datas.name;
                    self.selected(datas.datas);
                }
            }
            onFocusReleased: {
                var parent = self.parent;
                while (parent) {
                    if (!parent.parent.activeFocus) {
                        parent = parent.parent;
                    } else {
                        parent.focus = true;
                        parent = undefined;
                    }
                }
            }
        }
    }
}
