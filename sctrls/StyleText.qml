import QtQuick 2.5

Row {
    property var model
    property int pixelSize: 30
    property var fontFamily
    property bool isFocused: false
    property string color: "white"

    id: self
    spacing: 11
    Repeater {
        model: self.model
        delegate: Item {
            width: childrenRect.width
            height: childrenRect.height
            Component.onCompleted: {
                var createString = "";
                if (modelData.type == "text") {
                    createString = 'import QtQuick 2.5; Text {text: \'' 
                    + modelData.value.replace("'", "\\'").replace('\"', '\\"') + '\'; font.pixelSize: ' + self.pixelSize + '; font.family: "' + self.fontFamily + '"; color: ' + (modelData.color ? ('"' + modelData.color + '"') : 'self.color') + ';}';
                } else {
                    createString = 'import QtQuick 2.5; Image {source: "../images/' 
                    + modelData.value + '.png";}';
                }
                Qt.createQmlObject(createString, this);
            }
        }
    }
}
