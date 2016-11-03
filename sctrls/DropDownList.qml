import QtQuick 2.5

FocusScope {
    property var model: undefined
    property var labelText: "item"
    property var titleText: "choix d'un item"
    property var contentText: "undefined"

    signal opened(var component)
    signal selected(var datas)
    signal nameChanged(var datas)

    id: self
    focus: true
    width: 320
    height: 52
    Component.onCompleted: {
        var currentItem = self.model.get(self.currentIndex);
        if (currentItem) {
            nameChanged(currentItem.datas);
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
            font.pixelSize: 30
            color: "#999999"
            font.family: fontNormal.name
            text: self.labelText + " : "
            anchors.left: parent.left
        }
        Text {
            id: content
            font.pixelSize: 30
            font.family: fontNormal.name
            color: "#ffffff"
            text: self.contentText
            anchors.left: label.right
        }
    }
    Triangle {
        type: "down"
        width: 15
        height: 8
        anchors.right: self.right
        anchors.bottom: self.bottom
        anchors.bottomMargin: 30
    }
    Rectangle {
        anchors.bottom: self.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 2
        color: "#3F3F3F"
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
                    self.model.selectedIndex = datas.index;
                    self.nameChanged(datas.datas);
                    self.selected(datas.datas);
                }
            }
            onFocusReleased: {
                var parent = self;
                restoreFocus(parent);
            }
        }
    }
    function restoreFocus(parent) {
        if (!parent.activeFocus) {
            restoreFocus(parent.parent);
            parent.focus = true;
        }
    }
    function select(index) {
        var datas = self.model.get(index).datas;
        self.model.selectedIndex = index;
        self.nameChanged(datas.datas);
        self.selected(datas);
    }
}
