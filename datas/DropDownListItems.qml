import QtQuick 2.4

ListModel {
    id: self
    Component.onCompleted: {
        for (var i = 0; i < 20; i++) {
            self.append({
                datas: {
                    name: "item " + i,
                    url: i
                }
            });
        }
    }
}
