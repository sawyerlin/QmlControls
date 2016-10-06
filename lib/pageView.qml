import QtQuick 2.4

FocusScope {
    property var name: null
    anchors.fill: parent
    focus: true
    Keys.onPressed: {
        if (event.key == Qt.Key_Back || event.key == Qt.Key_Backspace) {
            event.accepted = true;
            navigation.pop();
        }
    }
    onActiveFocusChanged: {
        if (activeFocus) {
            console.log(name + " is focused");
        }
    }
    Rectangle {
        anchors.fill: parent
        color: "#242424"
    }
    
}
