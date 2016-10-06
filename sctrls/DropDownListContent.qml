import QtQuick 2.4

FocusScope {
    property var titleText: "undefined title"
    property var model: ListModel {}
    property var currentIndex: 0
    property var closeCallback: undefined

    signal selected(var datas)
    signal focusReleased()

    id: self
    focus: true
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 150
        text: titleText
        color: "white"
        font.pixelSize: 50
    }
    ListView {
        id: listView
        focus: true
        width: 299
        height: 500 
        spacing: 10 
        anchors.centerIn: parent
        model: self.model
        currentIndex: self.currentIndex
        delegate: Rectangle {
            height: 83
            anchors.left: parent.left
            anchors.right: parent.right
            color: activeFocus ? "#999999" : "#2B2B2B"
            transform: Scale {
                origin.x: width / 2
                origin.y: height / 2
                xScale: activeFocus ? 382 / 299 : 1
                yScale: activeFocus ? 99 / 83 : 1
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
            Text {
                anchors.centerIn: parent
                font.pixelSize: 30
                color: activeFocus ? "#767676" : "#4A4A4A"
                text: datas.name
            }
            Keys.onReturnPressed: {
                self.focusReleased();
                self.selected({
                    index: index,
                    datas: datas
                });
                if (self.closeCallback) {
                    self.closeCallback();
                }
            }
            Keys.onBackPressed: {
                event.received = true;
                self.focusReleased();
                if (self.closeCallback) {
                    self.closeCallback();
                }
            }
        }
        Component.onCompleted: positionViewAtIndex(self.currentIndex, ListView.Beginning)
    }
}
