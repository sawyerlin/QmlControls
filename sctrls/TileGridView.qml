import QtQuick 2.5

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
    anchors.bottomMargin: 50
    displayMarginBeginning: itemHeight * 2
    preferredHighlightBegin: 0
    preferredHighlightEnd: self.height - self.itemHeight
    highlightRangeMode: ListView.ApplyRange
    highlightMoveDuration: 300
    Keys.onPressed: {
        if (event.key == Qt.Key_Up || event.key == Qt.Key_Left) {
            if (currentIndex / 4 < 2) {
                self.preferredHighlightBegin = 0;
            } else {
                self.preferredHighlightBegin = -127;
            }
        } else if (event.key == Qt.Key_Down || event.key == Qt.Key_Right) {
            self.preferredHighlightBegin = -125;
            if (event.key == Qt.Key_Down) {
                if (Math.floor(currentIndex / self.columnSize) + 1 == Math.floor(self.model.count / self.columnSize)
                && self.model.count % columnSize != 0
                && currentIndex + self.columnSize > self.model.count - 1) {
                    currentIndex = self.model.count - 1;
                }
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
            highRightIcon: datas.highRightIcon
            highLeftIcon: datas.highLeftIcon
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
