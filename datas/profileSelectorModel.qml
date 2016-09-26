import QtQuick 2.4

ListModel {
    id: self
    Component.onCompleted: {
        for (var i = 0; i < 10; i ++) {
            self.append({
                "datas": {
                    "name": "profile " + i,
                    "avatar": "../images/User-50.png"
                }
            });
        }
    }
}
