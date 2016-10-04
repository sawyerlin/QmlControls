import QtQuick 2.4

GridView {
    property var itemHeight: 234 * hScale
    property var itemWidth: 414 * wScale
    property var columnSize: Math.floor(self.width / self.itemWidth)
    property var rowSize: Math.floor(self.height / self.itemHeight)
    property var widthSpacing: columnSize * (cellWidth - itemWidth) / (columnSize - 1)
    property var contentY: -self.visibleArea.yPosition * self.childrenRect.height

    id: self 
    anchors.fill: parent
    cellWidth: self.width / self.columnSize
    cellHeight: self.height / self.rowSize
    displayMarginBeginning: itemHeight / hScale
    displayMarginEnd: 0 * hScale
    delegate: FocusScope {
        width: self.cellWidth
        height: self.cellHeight
        z: activeFocus ? 1 : 0
        Tile {
            width: {
                if (datas) {
                    if (index == 0) {
                        self.itemWidth = datas.width * wScale;
                    }
                    return datas.width * wScale;
                } else {
                    return 0;
                }
            }
            height: {
                if (datas) {
                    if (index == 0) {
                        self.itemHeight = datas.height * hScale;
                    }
                    return datas.height * hScale;
                } else {
                    return 0;
                }
            }
            title: datas.title
            anchors.right: parent.right
            anchors.rightMargin: (index % columnSize + 1) * (cellWidth - itemWidth) - index % columnSize * widthSpacing 
            anchors.top: parent.top
            desc: datas.desc
            widthFocus: datas.widthFocus * wScale
            heightFocus: datas.heightFocus * hScale
            background: datas.background
            progressValue: datas.progressValue
            isParentFocused: false
        }
    }
}
