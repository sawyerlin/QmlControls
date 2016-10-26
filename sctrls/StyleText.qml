import QtQuick 2.5

Row {
    property var model: undefined

    id: self
    spacing: 11
    Repeater {
        model: self.model //datas.availability
        delegate: Item {
            width: childrenRect.width
            height: childrenRect.height
            Component.onCompleted: {
                var createString = "";
                if (modelData.type == "text") {
                    createString = 'import QtQuick 2.5; Text {text: "' 
                    + modelData.value + '"; font.pixelSize: 30; color: "' + (modelData.color || "white") + '";}';
                } else {
                    createString = 'import QtQuick 2.5; Image {source: "../../images/details/' 
                    + modelData.value + '.png";}';
                }
                Qt.createQmlObject(createString, this);
            }
        }
    }
}
