import QtQuick 2.4

Canvas {
    property string type: "next"
    property color strokeStyle:  "#ffffff"
    property color fillStyle: "#ffffff"
    property int lineWidth: 2
    property bool fill: true
    property bool stroke: activeFocus
    property real alpha: 1.0

    signal clicked()

    id: triangle
    antialiasing: true
    onLineWidthChanged: requestPaint()
    onFillChanged:requestPaint();
    onStrokeChanged:requestPaint();
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
            ctx.lineTo(0, triangle.height);
            break;
            case "left":
            ctx.moveTo(0, triangle.height / 2);
            ctx.lineTo(triangle.width, 0);
            ctx.lineTo(triangle.width, triangle.height);
            break;
            case "down":
            ctx.moveTo(triangle.width / 2, triangle.height);
            ctx.lineTo(triangle.width, 0);
            ctx.lineTo(0, 0);
            break;
        }
        ctx.closePath();
        if (triangle.fill) {ctx.fill();}
        if (triangle.stroke) {ctx.stroke();}
        ctx.restore();
    }
}
