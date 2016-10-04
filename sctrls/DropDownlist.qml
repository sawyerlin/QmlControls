import QtQuick 2.4

FocusScope {
    property var model: undefined
    property var labelText: "item"
    property var titleText: "choix d'un item"
    property var currentIndex: 0
    property var contentText: undefined 

    signal opened(var component)
    signal selected(var datas)

    id: self
    focus: true
    width: 400 * wScale
    height: 60 * hScale
    Component.onCompleted: self.contentText = self.model.get(self.currentIndex).datas.name
    Item {
        id: item
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: parent.right
        height: childrenRect.height
        Text {
            id: label
            font.pixelSize: 30 * hScale
            color: "#9C9C9C"
            text: self.labelText + " : "
            anchors.left: parent.left
        }
        Text {
            id: content
            font.pixelSize: 30 * hScale
            color: "white"
            text: self.contentText
            anchors.left: label.right
        }
        transform: Scale {
            origin.x: 0
            origin.y: item.height
            xScale: self.activeFocus ? 1.2 : 1
            yScale: self.activeFocus ? 1.2 : 1
            Behavior on xScale {
                NumberAnimation {
                    duration: 100 
                }
            }
            Behavior on yScale {
                NumberAnimation {
                    duration: 100 
                }
            }
        }
    }
    Triangle {
        type: "down"
        width: 18 * wScale
        height: 9 * hScale
        anchors.right: self.right
        anchors.verticalCenter: item.verticalCenter
    }
    Rectangle {
        anchors.bottom: self.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 2 * hScale
        color: "#393939"
    }
    Keys.onReturnPressed: opened(dropdownlist)
    Component {
        id: dropdownlist
        DropDownListContent {
            anchors.fill: parent
            titleText: self.titleText
            currentIndex: self.currentIndex
            model: self.model 
            onSelected: {
                var parent = self.parent;
                while (parent) {
                    if (!parent.parent.activeFocus) {
                        parent = parent.parent;
                    } else {
                        parent.focus = true;
                        parent = undefined;
                    }
                }
                self.currentIndex = datas.index;
                self.contentText = datas.datas.name;
                self.selected(datas.datas);
            }
        }
    }
}
