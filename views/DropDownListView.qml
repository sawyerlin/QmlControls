import QtQuick 2.4
import QtQuick.Dialogs 1.2

import "../lib"
import "../sctrls"

PageView {
    DropDownlist {
        focus: true
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 50
        anchors.topMargin: 50
        Keys.onReturnPressed: dialog.z = 100
    }
}
