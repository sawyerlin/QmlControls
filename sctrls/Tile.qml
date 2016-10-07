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
            Image {
                source: background || backgroundDefaultImage
                anchors.fill: parent
                fillMode: hasBackgroundImage ? Image.Stretch : Image.PreserveAspectFit
                anchors.centerIn: parent
            }
            Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                height: self.height * 0.3
                visible: showSubBand
                color: Qt.rgba(0, 0, 0, 0.7)
                Text {
                    text: self.title || "title undefined"
                    font.pixelSize: self.height * 0.1
                    font.bold: true
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.topMargin: self.height * 0.05
                    anchors.leftMargin: self.height * 0.08
                    anchors.rightMargin: self.height * 0.08
                    elide: Text.ElideRight
                    color: "white"
                }
                Text {
                    text: desc || "desc undefined"
                    font.pixelSize: self.height * 0.09
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.bottomMargin: self.height * 0.03
                    anchors.leftMargin: self.height * 0.08
                    anchors.right: parent.right
                    anchors.rightMargin: self.height * 0.08
                    elide: Text.ElideRight
                    color: "white"
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
