import QtQuick 2.5

FocusScope {
    property var model
    property var itemSpacing: 20
    property var itemHeight: 192
    property var focusPlace: "title"
    property bool headerShown: true
    property int displayMarginBeginning: 0
    property int rightMargin: 0
    property int cacheBuffer: 0

    signal moreClicked(var datas)
    signal clicked(int index, string title, bool autoPlay)

    id: self
    focus: true
    height: itemHeight + header.height
    TileHeader {
        id: header
        visible: headerShown && (self.model.count > 0 || self.model.emptyMessage != undefined)
        focus: self.focusPlace === "title" && !self.model.noTitleFocus
        noTitleFocus: !!self.model.noTitleFocus
        title: self.model.title
        color: self.model.color || "white"
        Keys.onReturnPressed: self.moreClicked(self.model.originDatas)
        KeyNavigation.down: !self.model.noTitleFocus ? list : null
    }
    ListView {
        id: list
        cacheBuffer: self.cacheBuffer
        focus: (self.focusPlace === "list" ? true : false) || !!self.model.noTitleFocus
        model: self.model
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: header.bottom
        spacing: itemSpacing
        orientation: ListView.Horizontal
        layoutDirection: Qt.LeftToRight
        highlightMoveDuration: 300
        displayMarginEnd: 50
        displayMarginBeginning: self.displayMarginBeginning
        anchors.rightMargin: self.rightMargin
        highlight: 
        Rectangle {
            x: list.currentItem.x - (list.currentItem.widthFocus - list.currentItem.width) / 2
            y: list.currentItem.y - (list.currentItem.heightFocus - list.currentItem.height) / 2
            z: list.currentItem.z + 1
            visible: list.activeFocus
            width: list.currentItem.widthFocus;
            height: list.currentItem.heightFocus 
            border.width: 3
            border.color: "#d3631f"
            color: "transparent"
        }
        highlightFollowsCurrentItem: false
        delegate: Tile {
            width: datas.width
            showBorder: false
            height: {
                if (index == 0) {
                    self.itemHeight = datas.height;
                }
                return datas.height;
            }
            autoPlay: !!datas.autoPlay
            title: datas.title
            desc: datas.desc
            descRight: datas.descRight
            highRightIcon: datas.highRightIcon
            highLeftIcon: datas.highLeftIcon
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
            Keys.onReturnPressed: {
                if (index === self.model.count - 1 && index > 0) {
                    self.moreClicked(self.model.originDatas)
                } else {
                    self.clicked(index, datas.title, self.model.datas.autoPlay || false)
                }
            }
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
            font.pixelSize: 30
            wrapMode: Text.Wrap
            width: parent.width
            text: self.model.emptyMessage || ""
        }
    }
}
