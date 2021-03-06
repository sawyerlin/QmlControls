import QtQuick 2.5

Canvas {
    property string type: "next"
    property color strokeStyle:  "#ffffff"
    property color fillStyle: "#ffffff"
    property int lineWidth: 2
    property bool fill: true
    property bool stroke: false
    property bool close: true
    property bool isFocus: false
    property real alpha: 1.0

    signal clicked()

    id: triangle
    antialiasing: true
    onLineWidthChanged: requestPaint()
    onFillChanged: requestPaint()
    onStrokeChanged: requestPaint()
    onIsFocusChanged: {
        if (triangle.isFocus) {
            triangle.fillStyle = "#d3631f";
            triangle.strokeStyle = "#d3631f";
        } else {
            triangle.fillStyle = "#ffffff";
            triangle.strokeStyle = "#ffffff";
        }
        requestPaint();
    }
    onPaint: {
        var ctx = getContext("2d");
        ctx.save();
        ctx.clearRect(0, 0, triangle.width, triangle.height);
        ctx.strokeStyle = triangle.strokeStyle;
        ctx.lineWidth = triangle.lineWidth;
        ctx.fillStyle = triangle.fillStyle;
        ctx.globalAlpha = triangle.alpha;
        ctx.lineJoin = "round";
        ctx.beginPath();
        switch (type) {
            case "right":
            ctx.moveTo(triangle.width, triangle.height / 2);
            ctx.lineTo(0, 0);
            ctx.moveTo(triangle.width, triangle.height / 2);
            ctx.lineTo(0, triangle.height);
            if (close) {
                ctx.moveTo(0, triangle.height);
                ctx.lineTo(0, 0);
            }
            break;
            case "left":
            ctx.moveTo(0, triangle.height / 2);
            ctx.lineTo(triangle.width, 0);
            ctx.moveTo(0, triangle.height / 2);
            ctx.lineTo(triangle.width, triangle.height);
            if (close) {
                ctx.moveTo(triangle.width, triangle.height);
                ctx.lineTo(triangle.width, 0);
            }
            break;
            case "down":
            ctx.moveTo(triangle.width / 2, triangle.height);
            ctx.lineTo(0, 0);
            ctx.lineTo(triangle.width, 0);
            break;
        }
        if (triangle.fill) { ctx.fill(); }
        if (triangle.stroke) { ctx.stroke(); }
        ctx.restore();
    }
}
