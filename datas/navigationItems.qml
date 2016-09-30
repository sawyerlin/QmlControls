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
            name: "TileListView",
            datas: {
                type: "tileRowContainerView",
                url: ""
            }
        });
        self.append({
            name: "ProfileSelector",
            isDefault: true,
            datas: {
                type: "profileSelectorView",
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
