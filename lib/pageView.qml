import QtQuick 2.4

FocusScope {
    property var name: null
    anchors.fill: parent
    focus: true
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
