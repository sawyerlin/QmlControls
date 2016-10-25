import QtQuick 2.4

FocusScope {
    property var model: undefined
    property var itemSpacing: 20
    property var itemHeight: 192
    property var focusPlace: "title"

    signal moreClicked(var datas)
    signal clicked(var sourceUrl)

    id: self
    focus: true
    height: itemHeight + header.height
    TileHeader {
        id: header
        focus: self.focusPlace == "title" && !self.model.noTitleFocus
        title: self.model.title
        color: self.model.color || "white"
        Keys.onReturnPressed: self.moreClicked(self.model.originDatas)
        KeyNavigation.down: !self.model.noTitleFocus ? list : null
    }
    ListView {
        id: list
        focus: (self.focusPlace == "list" ? true : false) || !!self.model.noTitleFocus
        model: self.model
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: header.bottom
        spacing: itemSpacing
        orientation: ListView.Horizontal
        layoutDirection: Qt.LeftToRight
        highlightMoveDuration: 100
        displayMarginEnd: 50
        delegate: Tile {
            width: datas.width
            height: {
                if (index == 0) {
                    self.itemHeight = datas.height;
                }
                return datas.height;
            }
            title: datas.title
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
            isParentFocused: self.activeFocus
            Keys.onReturnPressed: self.clicked(datas.sourceUrl)
        }
    }
    Item {
        visible: self.model.count == 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: header.bottom
        height: itemHeight
        Text {
            color: "white"
            font.family: fontNormal.name
            font.pixelSize: 25
            text: self.model.emptyMessage || ""
        }
    }
}
