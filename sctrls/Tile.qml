import QtQuick 2.5
import "."

FocusScope {
    property var title
    property var desc
    property var descRight
    property var highLeftIcon
    property var highRightIcon
    property var background
    property var backgroundDefaultImage: "../images/Image-50.png"
    property var progressValue
    property int widthFocus: 434
    property int heightFocus: 270
    property int bannerHeight: 84
    property int bannerTitleSize: 30
    property int bannerTitleTopMargin: 18
    property int bannerTitleLeftMargin: 21
    property int bannerDescSize: 20
    property int bannerDescBottomMargin: 15
    property int bannerDescLeftMargin: 21
    property bool showSubBand: true
    property bool autoPlay: false
    property bool isParentFocused: false
    property bool hasBackgroundImage: background != undefined && background != backgroundDefaultImage

    id: self
    focus: true
    z: activeFocus ? 1 : 0
    AnimateFocusScope {
        focus: true
        xScale: widthFocus / width
        yScale: heightFocus / height
        onXStopped: rectCover.visible = isParentFocused || self.activeFocus
        anchors.fill: parent
        Rectangle {
            anchors.fill: parent
            color: hasBackgroundImage ? "transparent" : "blue"
            Image {
                source: background || backgroundDefaultImage
                anchors.fill: parent
                fillMode: hasBackgroundImage ? Image.Stretch : Image.PreserveAspectFit
                anchors.centerIn: parent
                Image {
                    anchors.top: parent.top
                    anchors.right: parent.right
                    width: 70
                    height: 70
                    visible: self.highRightIcon != undefined
                    source: self.highRightIcon ? "../images/" + self.highRightIcon : ""
                }
                Image {
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    visible: self.highLeftIcon != undefined
                    source: self.highLeftIcon ? "../images/" + self.highLeftIcon : ""
                }
            }
            PlayButton {
                id: playButton
                visible: autoPlay
                showBorder: false
                anchors.centerIn: parent
                width: 50
                height: 50
                triangleWidth: 22
                triangleHeight: 28
            }
            Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                height: (!!desc || !!descRight) ? self.bannerHeight : titleText.height + 2 * bannerTitleTopMargin
                visible: showSubBand
                color: Qt.rgba(0, 0, 0, 0.6)
                Text {
                    id: titleText
                    text: self.title || ""
                    font.pixelSize: bannerTitleSize
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.topMargin: bannerTitleTopMargin
                    anchors.leftMargin: bannerTitleLeftMargin
                    anchors.rightMargin: bannerTitleLeftMargin
                    elide: (!!desc || !!descRight) ? Text.ElideRight : Text.ElideNone
                    wrapMode: (!!desc || !!descRight) ? Text.NoWrap : Text.Wrap
                    font.family: fontNormal.name
                    font.weight: Font.ExtraBold
                    color: "#FFFFFF"
                }
                Text {
                    visible: !!desc
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
                StyleText {
                    visible: !!descRight
                    model: descRight
                    fontFamily: fontNormal.name
                    pixelSize: bannerDescSize
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    anchors.bottomMargin: bannerDescBottomMargin
                    anchors.rightMargin: bannerDescLeftMargin
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
        Rectangle {
            visible: self.activeFocus
            border.width: 3
            border.color: "#d3631f"
            anchors.fill: parent
            color: "transparent"
        }
    }
}
