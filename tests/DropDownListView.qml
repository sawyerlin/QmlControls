import QtQuick 2.4

import "../lib"
import "../sctrls"
import "../datas"

PageView {
    DropDownlist {
        id: self
        focus: true
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 50
        anchors.topMargin: 50
        onOpened: dialog.show(component)
        onSelected: console.log(JSON.stringify(datas))
        model: DropDownListItems {}
    }
}
