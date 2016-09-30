import QtQuick 2.4

import "sctrls"
import "datas"
import "lib"
import "views"

StackView {
    id: navigation
    width: 1920
    height: 1080
    focus: true
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
            default: 
            navigation.push(emptyView, {}, true);
            break;
        }
    }
}
