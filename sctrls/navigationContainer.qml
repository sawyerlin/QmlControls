import QtQuick 2.4

FocusScope {
    property var backgroundColor: "#000000"
    property var currentIndex: 0
    property var currentModel: ["item0", "item1", "item2", "item3"]
    property var minFontSize: 30
    property var maxFontSize: 50
    property var itemSpacing: 30

    id: self
    Rectangle {
        id: rect
        anchors.fill: parent
        color: backgroundColor
        Row {
            anchors.verticalCenter: parent.verticalCenter
            spacing: itemSpacing
            Repeater {
                model: currentModel
                NavigationItem {
                    focus: index == currentIndex
                    itemValue: modelData
                    Keys.onPressed: {
                        switch (event.key) {
                            case Qt.Key_Left:
                            if (currentIndex > 0) {
                                currentIndex --;
                                event.accepted = true;
                            }
                            break;
                            case Qt.Key_Right:
                            if (currentIndex < currentModel.length - 1) {
                                currentIndex ++;
                                event.accepted = true;
                            }
                            break;
                        }
                    }
                }
            }
        }
    }
}
