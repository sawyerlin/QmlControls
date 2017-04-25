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
    property int bannerDescSize: 16
    property int bannerDescBottomMargin: 15
    property int bannerDescLeftMargin: 21
    property bool showSubBand: true
    property bool autoPlay: false
    property bool isParentFocused: false
    property bool hasBackgroundImage: background != undefined && background != backgroundDefaultImage
    property bool showBorder: true

    id: self
    focus: true
    z: activeFocus ? 1 : 0
    AnimateFocusScopeLoader {
        focus: true
        xScale: widthFocus / width
        yScale: heightFocus / height
        anchors.fill: parent
        showBorder: self.showBorder
        sourceComponent: Item {
            ImageFade {
                source: self.background || self.backgroundDefaultImage
                anchors.fill: parent
                fillMode: self.hasBackgroundImage ? Image.Stretch : Image.PreserveAspectFit
                Image {
                    visible: self.highRightIcon !== undefined
                    anchors.top: parent.top
                    anchors.right: parent.right
                    width: 70
                    height: 70
                    source: self.highRightIcon ? "../images/" + self.highRightIcon : ""
                }
                Image {
                    visible: self.highLeftIcon !== undefined
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    source: self.highLeftIcon ? "../images/" + self.highLeftIcon : ""
                }
            }
            Loader {
                active: self.autoPlay
                anchors.centerIn: parent
                width: 50
                height: 50
                sourceComponent: PlayButton {
                    visible: autoPlay
                    showBorder: false
                    anchors.fill: parent
                    triangleWidth: 22
                    triangleHeight: 28
                }
            }
            Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                height: self.bannerHeight 
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
                    elide: Text.ElideRight
                    wrapMode: Text.NoWrap 
                    font.family: fontNormal.name
                    font.weight: Font.ExtraBold
                    color: "#FFFFFF"
                }
                Text {
                    visible: !!desc
                    text: desc
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
                Loader {
                    active: descRight[0].value !== ""
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    anchors.bottomMargin: bannerDescBottomMargin
                    anchors.rightMargin: bannerDescLeftMargin
                    sourceComponent: StyleText {
                        model: descRight
                        fontFamily: fontNormal.name
                        pixelSize: bannerDescSize
                    }
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
            Rectangle {
                id: rectCover
                visible: !isParentFocused && !self.activeFocus
                color: Qt.rgba(0, 0, 0, 0.5)
                width: parent.width
                height: parent.height
            }
        }
    }
}
