import QtQuick 2.4

import "../sctrls"
import "../datas"
import "../lib"
import "../views"

StackView {
    id: navigation
    initialItem: tileRowContainerView
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
            name: "tileRowContainer"
        }
    }
    Component {
        id: emptyView
        EmptyView {
            name: "emptyView"
        }
    }
    function change(name) {
        switch(name) {
            case "tileRowContainerView":
            navigation.push(tileRowContainerView, true);
            break;
            case "imageButtonView":
            navigation.push(imageButtonView, true);
            break;
            default: 
            navigation.push(emptyView, true);
            break;
        }
    }
}
