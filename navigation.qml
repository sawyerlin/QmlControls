import QtQuick 2.4

import "sctrls"
import "datas"
import "lib"
import "tests"

StackView {
    id: navigation
    focus: true
    width: 1920
    height: 1080
    transform: Scale {origin.x: 0; origin.y: 0; xScale: parent.width / width; yScale: parent.height / height}
    Component {
        id: imageButtonView
        ImageButtonView {
            name: "imageButtons"
        }
    }
    Component {
        id: tileRowContainerView
        TileRowContainerView {
            name: "tileListView"
        }
    }
    Component {
        id: tileGridContainerView
        TileGridContainerView {
            name: "tileGridView"
        }
    }
    Component {
        id: profileSelectorView
        ProfileSelectorView {
            name: "profileSelectorView"
        }
    }
    Component {
        id: dropDownListView
        DropDownListView{
            name: "dropDownListView"
        }
    }
    Component {
        id: emptyView
        EmptyView {
            name: "emptyView"
        }
    }
    function change(name) {
        console.log(name);
        switch(name) {
            case "tileRowContainerView":
            navigation.push(tileRowContainerView, {}, true);
            break;
            case "tileGridContainerView":
            navigation.push(tileGridContainerView, {}, true);
            break;
            case "imageButtonView":
            navigation.push(imageButtonView, {}, true);
            break;
            case "profileSelectorView":
            navigation.push(profileSelectorView, {}, true);
            break;
            case "dropDownListView":
            navigation.push(dropDownListView, {}, true);
            break;
            default: 
            navigation.push(emptyView, {}, true);
            break;
        }
    }
}
