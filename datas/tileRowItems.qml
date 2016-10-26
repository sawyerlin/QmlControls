import QtQuick 2.5

ListModel {
    id: self
    Component.onCompleted: {
        for (var i = 0; i < 10; i ++) {
            self.append({
                datas: {
                    "title": "item " + i,
                    "desc": "item " + i + " desc",
                    "background": "../images/Image-50.png",
                    "sourceUrl:": "",
                    progressValue: 0,
                    width: 342,
                    height: 192,
                    widthFocus: 399,
                    heightFocus: 225
                }
            });
        }
    }
}
