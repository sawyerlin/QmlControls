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
        id: title
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 50
        text: titleText
        color: "white"
        font.pixelSize: 50
    }
    ListView {
        id: listView
        focus: true
        width: 299
        spacing: 10 
        anchors.bottom: parent.bottom
        anchors.top: title.bottom
        anchors.topMargin: 60
        anchors.horizontalCenter: parent.horizontalCenter
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
                    event.received = true;
                    self.focusReleased();
                    if (self.closeCallback) {
                        self.closeCallback();
                    }
                    break;
                }
                
            }
        }
        
        Component.onCompleted: positionViewAtIndex(self.currentIndex, ListView.Beginning)
    }
}
