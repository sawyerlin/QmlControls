import QtQuick 2.4

FocusScope {
    property var title: undefined
    property var desc: undefined
    property var background: undefined
    property var progressValue: undefined
    property var widthFocus: 434
    property var heightFocus: 270
    property var isParentFocused: false
    property var backgroundDefaultImage: "../images/Image-50.png"
    property var hasBackgroundImage: background != undefined && background != backgroundDefaultImage
    property var bannerHeight: 84
    property var bannerTitleSize: 30
    property var bannerTitleTopMargin: 18
    property var bannerTitleLeftMargin: 21
    property var bannerDescSize: 20
    property var bannerDescBottomMargin: 15
    property var bannerDescLeftMargin: 21
    property var showSubBand: true

    id: self
    focus: true
    z: activeFocus ? 1 : 0
    AnimateFocusScope {
        focus: true
        xScale: widthFocus / width
        yScale: heightFocus /height
        onXStopped: rectCover.visible = isParentFocused || self.activeFocus
        anchors.fill: parent
        Rectangle {
            anchors.fill: parent
            color: hasBackgroundImage ? "transparent" : "blue"
            ImageFade {
                source: background || backgroundDefaultImage
                anchors.fill: parent
                fillMode: hasBackgroundImage ? Image.Stretch : Image.PreserveAspectFit
                anchors.centerIn: parent
            }
            Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                height: self.bannerHeight
                visible: showSubBand
                color: Qt.rgba(0, 0, 0, 0.6)
                Text {
                    text: self.title || "title undefined"
                    font.pixelSize: bannerTitleSize
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.topMargin: bannerTitleTopMargin
                    anchors.leftMargin: bannerTitleLeftMargin
                    anchors.rightMargin: bannerTitleLeftMargin
                    elide: Text.ElideRight
                    font.family: fontBold.name
                    color: "#FFFFFF"
                }
                Text {
                    text: desc || "desc undefined"
                    font.pixelSize: bannerDescSize
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.bottomMargin: bannerDescBottomMargin
                    anchors.leftMargin: bannerDescLeftMargin
                    anchors.right: parent.right
                    elide: Text.ElideRight
                    font.family: fontNormal.name
                    color: "#CCCCCC"
                }
                anchors.bottom: progressBar.top
            }
            CustomProgressBar {
                id: progressBar
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                value: progressValue
                visibleHeight: 5
            }
        }
        Rectangle {
            id: rectCover
            visible: !isParentFocused && !self.activeFocus
            color: Qt.rgba(0, 0, 0, 0.5)
            width: parent.width
            height: parent.height
        }
    }
}
