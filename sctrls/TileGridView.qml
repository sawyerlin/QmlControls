import QtQuick 2.4

GridView {
    property var itemHeight: 234 
    property var itemWidth: 414 
    property var columnSize: Math.floor(self.width / self.itemWidth)
    property var rowSize: Math.floor(self.height / self.itemHeight)
    property var widthSpacing: columnSize * (cellWidth - itemWidth) / (columnSize - 1)
    property var contentY: -self.visibleArea.yPosition * self.childrenRect.height

    signal clicked(var sourceUrl)
    
    id: self 
    height: self.itemHeight * 4
    anchors.fill: parent
    cellWidth: self.width / self.columnSize
    cellHeight: self.itemHeight + 20
    displayMarginBeginning: itemHeight * 2
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
            isParentFocused: false
            Keys.onReturnPressed: self.clicked(datas.sourceUrl)
        }
    }
}
