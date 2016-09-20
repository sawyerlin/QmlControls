import QtQuick 2.4

FocusScope {
    property var titleContent: "Title"
    property var descContent: "description"
    property var background: "../images/Image-50.png"

    id: self
    focus: true
    FocusScope {
        focus: true
        anchors.fill: parent
        Rectangle {
            anchors.fill: parent
            color: "blue"
            Image {
                source: background
                anchors.centerIn: parent
            }
            Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                height: self.height * 0.3
                color: Qt.rgba(0, 0, 0, 0.7)
                Text {
                    text: titleContent 
                    font.pixelSize: self.height * 0.1
                    font.bold: true
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.topMargin: self.height * 0.05
                    anchors.leftMargin: self.height * 0.08
                    color: "white"
                }
                Text {
                    text: descContent
                    font.pixelSize: self.height * 0.09
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.bottomMargin: self.height * 0.03
                    anchors.leftMargin: self.height * 0.08
                    color: "white"
                }
            }
        }
        transform: Scale {
            origin.x: width / 2
            origin.y: height / 2
            xScale: activeFocus ? 1.1 : 1
            yScale: activeFocus ? 1.1 : 1
            Behavior on xScale {
                NumberAnimation { 
                    duration: 100 
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
