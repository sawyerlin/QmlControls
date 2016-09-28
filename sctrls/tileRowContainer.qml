import QtQuick 2.4

FocusScope {
    property var model: undefined
    property var itemSpacing: 10
    property var itemHeight: 192 * hScale

    signal moreClicked(var sourceUrl)

    id: self
    focus: true
    height: (itemHeight + header.height) * hScale
    TileHeader {
        id: header
        focus: true
        title: self.model.title
        color: self.model.color || "white"
        KeyNavigation.down: list
        Keys.onPressed: {
            if (event.key == Qt.Key_Return) {
                moreClicked(self.model.sourceUrl);
            }
        }
    }
    ListView {
        id: list
        model: self.model
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: header.bottom
        spacing: itemSpacing * wScale
        orientation: ListView.Horizontal
        layoutDirection: Qt.LeftToRight
        highlightMoveDuration: 100
        displayMarginEnd: 50
        delegate: Tile {
            width: datas.width * wScale
            height: datas.height * hScale
            title: datas.title
            desc: datas.desc
            widthFocus: datas.widthFocus * wScale
            heightFocus: datas.heightFocus * hScale
            background: datas.background
            progressValue: datas.progressValue
            isParentFocused: self.activeFocus
            Component.onCompleted: {
                if (index == 0) {
                    self.itemHeight = datas.height;
                }
            }
        }
    }
    Item {
        visible: self.model.count == 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: header.bottom
        height: itemHeight * hScale
        Text {
            color: "white"
            font.pixelSize: 25 * hScale
            text: self.model.emptyMessage || ""
        }
    }
}
