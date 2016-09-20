import QtQuick 2.4

FocusScope {
    id: self
    focus: true
    FocusScope {
        focus: true
        anchors.fill: parent
        Rectangle {
            anchors.fill: parent
            color: "blue"
            Image {
                source: "../images/Image-50.png"
                anchors.centerIn: parent
            }
            Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                height: self.height * 0.3
                color: "black"
                Text {
                    id: title
                    text: "Title"
                    font.pixelSize: self.height * 0.12
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.topMargin: self.height * 0.03
                    anchors.leftMargin: self.height * 0.08
                    color: "white"
                }
                Text {
                    text: "detail"
                    font.pixelSize: self.height * 0.08
                    anchors.top: title.bottom
                    anchors.left: parent.left
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
