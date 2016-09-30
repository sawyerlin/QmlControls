import QtQuick 2.4

FocusScope {
    property var model: undefined
    property var itemHeight: 234 * hScale
    property var itemWidth: 414 * wScale
    property var columnSize: Math.floor(self.width / self.itemWidth)
    property var rowSize: Math.floor(self.height / self.itemHeight)
    property var cellWidth: self.width / self.columnSize
    property var cellHeight: self.height / self.rowSize
    property var widthSpacing: columnSize * (cellWidth - itemWidth) / (columnSize - 1)

    id: self
    focus: true
    GridView {
        id: grid
        focus: true
        anchors.fill: parent
        model: self.model
        cellWidth: self.cellWidth
        cellHeight: self.cellHeight
        delegate: FocusScope {
            width: self.cellWidth
            height: self.cellHeight
            Tile {
                focus: true
                width: datas.width * wScale
                height: datas.height * hScale
                title: datas.title
                anchors.right: parent.right
                anchors.rightMargin: (index % columnSize + 1) * (cellWidth - itemWidth) - index % columnSize * widthSpacing 
                anchors.top: parent.top
                desc: datas.desc
                widthFocus: datas.widthFocus * wScale
                heightFocus: datas.heightFocus * hScale
                background: datas.background
                progressValue: datas.progressValue
                isParentFocused: self.activeFocus
                Component.onCompleted: {
                    if (index == 0) {
                        self.itemHeight = datas.height * hScale;
                        self.itemWidth = datas.width * wScale;
                    }
                }
            }
        }
    }
}
