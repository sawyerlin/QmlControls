import QtQuick 2.5

FocusScope {
    property var xOrigin
    property var yOrigin
    property var xScale: 1
    property var yScale: 1
    property var duration: 100

    signal xStopped()
    signal yStopped()

    id: self
    focus: true
    z: activeFocus ? 1 : 0
    transform: Scale {
        origin.x: self.xOrigin !== undefined ? self.xOrigin : self.width / 2
        origin.y: self.yOrigin !== undefined ? self.yOrigin : self.height / 2
        xScale: activeFocus ? self.xScale : 1
        yScale: activeFocus ? self.yScale : 1
        Behavior on xScale {
            NumberAnimation { 
                duration: self.duration
                onStopped: self.xStopped()
            }
        }
        Behavior on yScale {
            NumberAnimation { 
                duration: self.duration
                onStopped: self.yStopped()
            }
        }
    }
}
