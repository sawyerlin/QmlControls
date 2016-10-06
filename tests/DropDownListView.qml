import QtQuick 2.4

import "../lib"
import "../sctrls"
import "../datas"

PageView {
    DropDownList {
        id: self
        focus: true
        anchors.centerIn: parent
        onOpened: dialog.show(component)
        onSelected: console.log(JSON.stringify(datas))
        model: DropDownListItems {}
    }
}
