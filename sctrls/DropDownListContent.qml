import QtQuick 2.5

import "."

FocusScope {
    property var text
    property int currentIndex
    property var closeCallback
    property var model
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
        text: self.text
        color: "white"
        font.pixelSize: 50
        font.family: fontNormal.name
    }
    ListView {
        id: listView
        spacing: 20
        width: self.maxWidth + 96 * 2
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.top: title.bottom
        anchors.topMargin: 60
        anchors.horizontalCenter: parent.horizontalCenter
        model: self.model
        currentIndex: self.currentIndex
        highlightMoveDuration: 300
        delegate: AnimateFocusScopeLoader {
            height: 83
            xScale: 382 / 299
            yScale: 99 / 83
            anchors.left: parent.left
            anchors.right: parent.right
            sourceComponent: Rectangle {
                width: self.maxWidth + 96 * 2
                height: 96
                focus: parent.activeFocus
                color: activeFocus ? "#999999" : "#2b2b2b"
                StyleText {
                    id: text
                    anchors.centerIn: parent
                    color: parent.activeFocus ? "#000000" : "#ffffff"
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
                    value: {
                        if (typeof bookmarks !== 'undefined') {
                            if (datas.originData.episodes) {
                                for (var index in datas.originData.episodes) {
                                    var lastIndex = datas.originData.episodes.length - index - 1,
                                        episode = datas.originData.episodes[lastIndex],
                                        bookmark = getBookmark(episode.id, "player");
                                    if (bookmark && bookmark.position >= 90) {
                                        return Math.ceil((lastIndex + 1) / datas.originData.episodes.length * 100);
                                    }
                                }
                                return 0;
                            } else {
                                var bookmark = getBookmark(datas.originData.id, "player"); 
                                if (bookmark) {
                                    return bookmark.position > 90 ? 100 : bookmark.position;
                                }
                            }
                        }
                    }
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
                    case Qt.Key_Escape:
                    self.focusReleased();
                    if (self.closeCallback) {
                        self.closeCallback();
                    }
                    event.accepted = true;
                    break;
                }
            }
        }
        Component.onCompleted: {
            positionViewAtIndex(self.currentIndex, ListView.Beginning);
            listView.focus = true;
        }
    }
}
