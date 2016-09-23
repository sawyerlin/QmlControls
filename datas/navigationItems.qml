import QtQuick 2.4

ListModel {
    id: self
    Component.onCompleted: {
        self.append({
            name: "ImageButton",
            datas: {
                type: "imageButtonView",
                url: ""
            }
        });
        self.append({
            name: "TileRowContainer",
            isDefault: true,
            datas: {
                type: "tileRowContainerView",
                url: ""
            }
        });
        self.append({
            name: "TileGridContainer",
            datas: {
                type: "tileGridContainer",
                url: ""
            }
        });
    }
}
