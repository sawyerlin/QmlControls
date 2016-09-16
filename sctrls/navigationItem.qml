import QtQuick 2.4

FocusScope {
    property var focusSize: 50 
    property var unFocusSize: 30 
    property var focusColor: "#ffffff"
    property var unFocusColor: "#cccccc"
    property var itemValue: "item"

    property var isFocused: false

    width: childrenRect.width
    height: focusSize
    onActiveFocusChanged: {
        if (activeFocus) {
            animationMaxSize.start();
            animationFocusColor.start();
        } else {
            animationMinSize.start();
            animationUnFocusColor.start();
        }
    }
    Text {
        id: text
        color: isFocused ? focusColor : unFocusColor
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: isFocused ? focusSize : unFocusSize
        text: itemValue
    }
    PropertyAnimation {
        id: animationMaxSize
        target: text
        properties: "font.pixelSize"
        to: focusSize
        duration: 100
    }
    PropertyAnimation {
        id: animationMinSize
        target: text
        properties: "font.pixelSize"
        to: unFocusSize
        duration: 100
    }
    PropertyAnimation {
        id: animationFocusColor
        target: text
        properties: "color"
        to: focusColor
        duration: 100
    }
    PropertyAnimation {
        id: animationUnFocusColor
        target: text
        properties: "color"
        to: unFocusColor
        duration: 100
    }
}
