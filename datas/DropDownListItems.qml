import QtQuick 2.5

ListModel {
    property var selectedIndex: 0

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
