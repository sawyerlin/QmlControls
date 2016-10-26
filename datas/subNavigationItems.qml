import QtQuick 2.5

ListModel {
    id: self
    Component.onCompleted: {
        self.append({
            name: "TileRowNormalView",
            datas: {
                type: "tileRowNormalView",
                url: ""
            }
        });
        self.append({
            name: "TileRowProfileView",
            isDefault: true,
            datas: {
                type: "tileRowProfileView",
                url: ""
            }
        });
    }
}
