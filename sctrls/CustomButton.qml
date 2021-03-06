import QtQuick 2.5
import QtGraphicalEffects 1.0

AnimateFocusScopeLoader {
    property var text
    property var imageSource

    id: self
    xScale: 1.1
    yScale: 1.1
    width: 419
    height: 84
    sourceComponent: FocusScope {
        RectangularGlow {
            anchors.fill: parent
            glowRadius: 10
            color: Qt.rgba(0, 0, 0, 0.2)
            cornerRadius: 0
        }
        Rectangle {
            anchors.fill: parent
            color: "#2B2B2B"
        }
        Item {
            anchors.centerIn: parent
            width: customText.width + (customImage.visible ? customImage.width + 10 : 0)
            Text {
                id: customText
                anchors.right: customImage.visible ? customImage.left : undefined
                anchors.rightMargin: customImage.visible ? 10 : 0
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 28
                font.family: fontNormal.name
                text: self.text
                color: "#999999"
            }
            Image {
                id: customImage
                visible: self.imageSource !== undefined
                anchors.right: visible ? parent.right : undefined
                anchors.verticalCenter: parent.verticalCenter
                source: self.imageSource || ""
            }
        }
    }
}
