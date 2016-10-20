import QtQuick 2.4

GridView {
    property var itemHeight: 234 
    property var itemWidth: 414 
    property var columnSize: Math.floor(self.width / self.itemWidth)
    property var rowSize: Math.floor(self.height / self.itemHeight)
    property var widthSpacing: columnSize * (cellWidth - itemWidth) / (columnSize - 1)
    property var contentY: -self.visibleArea.yPosition * self.childrenRect.height
    property var preferredBegin: self.itemHeight
    property var preferredEnd: self.itemHeight * 2

    signal clicked(var sourceUrl)
    
    id: self 
    anchors.fill: parent
    cellWidth: self.width / self.columnSize
    cellHeight: self.itemHeight + 20
    displayMarginBeginning: itemHeight * 2
    preferredHighlightBegin: 0
    preferredHighlightEnd: self.height - self.itemHeight
    highlightRangeMode: ListView.ApplyRange
    Keys.onPressed: {
        if (event.key == Qt.Key_Up) {
            if (self.currentIndex >= self.columnSize) {
                self.preferredHighlightBegin = 0;
            }
        } else if (event.key == Qt.Key_Down) {
            if (self.currentIndex <= self.columnSize) {
                self.preferredHighlightBegin = -110;
            }
        }
    }
    delegate: FocusScope {
        width: self.cellWidth
        height: self.cellHeight
        z: activeFocus ? 1 : 0
        Tile {
            width: {
                if (datas) {
                    if (index == 0) {
                        self.itemWidth = datas.width;
                    }
                    return datas.width;
                } else {
                    return 0;
                }
            }
            height: {
                if (datas) {
                    if (index == 0) {
                        self.itemHeight = datas.height;
                    }
                    return datas.height;
                } else {
                    return 0;
                }
            }
            title: datas.title
            anchors.right: parent.right
            anchors.rightMargin: (index % columnSize + 1) * (cellWidth - itemWidth) - index % columnSize * widthSpacing 
            anchors.top: parent.top
            desc: datas.desc
            isParentFocused: false
            widthFocus: datas.widthFocus
            heightFocus: datas.heightFocus 
            background: datas.background
            progressValue: datas.progressValue
            bannerHeight: datas.bannerHeight
            bannerTitleSize: datas.bannerTitleSize
            bannerTitleTopMargin: datas.bannerTitleTopMargin
            bannerTitleLeftMargin: datas.bannerTitleLeftMargin
            bannerDescSize: datas.bannerDescSize
            bannerDescBottomMargin: datas.bannerDescBottomMargin
            bannerDescLeftMargin: datas.bannerDescLeftMargin
            Keys.onReturnPressed: self.clicked(datas.sourceUrl)
        }
    }
}
