import QtQuick 2.5

import "."

FocusScope {
    property var titleText: "undefined title"
    property var model: ListModel {}
    property var currentIndex: 0
    property var closeCallback
    property var maxWidth: 0

    signal selected(var datas)
    signal focusReleased()

    id: self
    focus: true
    Text {
        id: title
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 50
        text: titleText
        color: "white"
        font.pixelSize: 50
        font.family: fontNormal.name
    }
    ListView {
        id: listView
        focus: true
        spacing: 20
        width: self.maxWidth + 96 * 2
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.top: title.bottom
        anchors.topMargin: 60
        anchors.horizontalCenter: parent.horizontalCenter
        model: self.model
        currentIndex: self.currentIndex
        highlightMoveDuration: 100
        delegate: AnimateFocusScope {
            height: 83
            xScale: 382 / 299
            yScale: 99 / 83
            anchors.left: parent.left
            anchors.right: parent.right
            Rectangle {
                width: self.maxWidth + 96 * 2
                height: 96
                focus: parent.activeFocus
                color: activeFocus ? "#999999" : "#2b2b2b"
                StyleText {
                    id: text
                    anchors.left: parent.left
                    anchors.leftMargin: 96
                    anchors.verticalCenter: parent.verticalCenter
                    onWidthChanged: {
                        self.maxWidth = Math.max(width, self.maxWidth);
                        return self.maxWidth;
                    }
                    model: datas.name
                }
                CustomProgressBar {
                    id: progressBar
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    value: datas.progressValue
                    visibleHeight: 5
                }
            }
            Keys.onPressed: {
                switch(event.key) {
                    case Qt.Key_Return:
                    self.focusReleased();
                    self.selected({
                        index: index,
                        datas: datas
                    });
                    if (self.closeCallback) {
                        self.closeCallback();
                    }
                    break;
                    case Qt.Key_Back:
                    case Qt.Key_Backspace:
                    self.focusReleased();
                    if (self.closeCallback) {
                        self.closeCallback();
                    }
                    event.accepted = true;
                    break;
                }
            }
        }
        Component.onCompleted: positionViewAtIndex(self.currentIndex, ListView.Beginning)
    }
}
