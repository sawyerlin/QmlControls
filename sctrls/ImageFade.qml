import QtQuick 2.5

Image {
    opacity: status == Image.Ready ? 1 : 0
    Behavior on opacity {
        NumberAnimation { 
            duration: 500
            easing.type: Easing.OutQuad 
            from: 0
            to: 1
        }
    }
}
