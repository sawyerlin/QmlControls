import QtQuick 2.4

import "../../sctrls"
import "../../datas"
import "../../lib"
import "../../views"

StackView {
    id: navigation
    initialItem: tileNormalView
    width: 1920
    height: 1080
    focus: true
    Component {
        id: tileNormalView
        ImageButtonView {
            name: "tileNormalView"
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
            case "tileNormalView":
            navigation.push(tileNormalView, true);
            break;
            //case "imageButtonView":
            //navigation.push(imageButtonView, true);
            //break;
            default: 
            navigation.push(emptyView, true);
            break;
        }
    }
}
