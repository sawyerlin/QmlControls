import QtQuick 2.4

FocusScope {
    property var title: undefined
    property var desc: undefined
    property var background: undefined
    property var progressValue: undefined
    property var widthFocus: 434 * wScale
    property var heightFocus: 270 * hScale
    property var isParentFocused: false
    property var backgroundDefaultImage: "../images/Image-50.png"
    property var hasBackgroundImage: background != undefined && background != backgroundDefaultImage
    property var showSubBand: true

    id: self
    focus: true
    z: activeFocus ? 1 : 0
    FocusScope {
        focus: true
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
            visible: !isParentFocused
            color: Qt.rgba(0, 0, 0, 0.5)
            width: parent.width
            height: parent.height
        }
        transform: Scale {
            origin.x: width / 2
            origin.y: height / 2
            xScale: activeFocus ? widthFocus / width : 1
            yScale: activeFocus ? heightFocus / height : 1
            Behavior on xScale {
                NumberAnimation { 
                    duration: 100 
                    onStopped: {
                        rectCover.visible = isParentFocused
                    }
                }
            }
            Behavior on yScale {
                NumberAnimation { 
                    duration: 100 
                }
            }
        }
    }
}
