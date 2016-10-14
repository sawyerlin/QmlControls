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
        font.family: fontNormal.name
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
        highlightMoveDuration: 100
        delegate: AnimateFocusScope {
            height: 83
            xScale: 382 / 299
            yScale: 99 / 83
            anchors.left: parent.left
            anchors.right: parent.right
            Rectangle {
                anchors.fill: parent
                color: parent.activeFocus ? "#999999" : "#2B2B2B"
                Text {
                    anchors.centerIn: parent
                    font.pixelSize: 30
                    font.family: fontNormal.name
                    color: parent.activeFocus ? "#767676" : "#4A4A4A"
                    text: datas.name
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
