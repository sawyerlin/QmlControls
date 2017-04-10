import QtQuick 2.5

FocusScope {
    property var xOrigin
    property var yOrigin
    property var xScale: 1
    property var yScale: 1
    property var duration: 100
    property var type: "border"
    property bool showBorder: true
    property alias sourceComponent: loader.sourceComponent
    property alias item: loader.item

    id: self
    focus: true
    z: activeFocus ? 1 : 0
    Loader {
        id: loader
        focus: true
        anchors.fill: parent
        transform: Scale {
            origin.x: self.xOrigin !== undefined ? self.xOrigin : self.width / 2
            origin.y: self.yOrigin !== undefined ? self.yOrigin : self.height / 2
            xScale: activeFocus ? self.xScale : 1
            yScale: activeFocus ? self.yScale : 1
            Behavior on xScale {
                SequentialAnimation {
                    ScriptAction {
                        script: {
                            if (!self.activeFocus) {
                                if (type === "border" && self.showBorder) {
                                    border.visible = false;
                                } else if (type === "underline") {
                                    underline.visible = false;
                                }
                            }
                        }
                    }
                    NumberAnimation { 
                        duration: self.duration
                    }
                    ScriptAction {
                        script: {
                            if (self.activeFocus) {
                                if (type === "border" && self.showBorder) {
                                    border.visible = true;
                                } else if (type === "underline") {
                                    underline.visible = true;
                                }
                            }
                        }
                    }
                }
            }
            Behavior on yScale {
                NumberAnimation { 
                    duration: self.duration
                }
            }
        }
    }
    Rectangle {
        id: border
        visible: loader.activeFocus && self.type === "border" && self.showBorder
        width: (parent.width) * self.xScale
        height: (parent.height) * self.yScale
        border.width: 3
        border.color: "#d3631f"
        color: "transparent"
        x: (parent.width) * (1 - self.xScale) / 2 
        y: (parent.height) * (1 - self.yScale) / 2
    }
    Rectangle {
        id: underline
        visible: loader.activeFocus && self.type === "underline"
        anchors.top: loader.bottom
        anchors.topMargin: 5
        anchors.left: loader.left
        anchors.right: loader.right
        height: 3
        width: (parent.height) * self.yScale
        color: "#d3631f"
    }
}
