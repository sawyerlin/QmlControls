import QtQuick 2.4

ListModel {
    id: self
    Component.onCompleted: {
        for (var i = 0; i < 100; i ++) {
            self.append({
                datas: {
                    "title": "item " + i,
                    "desc": "item " + i + " desc",
                    "background": "../images/Image-50.png",
                    "sourceUrl:": "",
                    progressValue: 0,
                    width: 414,
                    height: 234,
                    widthFocus: 472,
                    heightFocus: 266
                }
            });
        }
    }
}
