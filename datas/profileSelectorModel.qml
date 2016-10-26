import QtQuick 2.5

ListModel {
    id: self
    Component.onCompleted: {
        for (var i = 0; i < 10; i ++) {
            self.append({
                datas: {
                    id: undefined,
                    name: "profile " + i,
                    avatar: "../images/User-50.png",
                    isChild: false
                }
            });
        }
    }
}
