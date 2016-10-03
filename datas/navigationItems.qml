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
            datas: {
                type: "profileSelectorView",
                url: ""
            }
        });
        self.append({
            name: "TileGridContainer",
            datas: {
                type: "tileGridContainerView",
                url: ""
            }
        });
        self.append({
            name: "DropDownList",
            isDefault: true,
            datas: {
                type: "dropDownListView",
                url: ""
            }
        });
    }
}
