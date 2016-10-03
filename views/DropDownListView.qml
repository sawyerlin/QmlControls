import QtQuick 2.4
import QtQuick.Dialogs 1.2

import "../lib"
import "../sctrls"

PageView {
    DropDownlist {
        id: self
        focus: true
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 50
        anchors.topMargin: 50
        Keys.onReturnPressed: dialog.show(function() {
            var parent = self.parent;
            while (parent) {
                console.log(parent.activeFocus);
                if (!parent.parent.activeFocus) {
                    parent = parent.parent;
                } else {
                    parent.focus = true;
                    parent = undefined;
                }
            }
        })
    }
}
