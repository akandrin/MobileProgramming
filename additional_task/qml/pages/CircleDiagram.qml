import QtQuick 2.0

Item {
    property alias angle: canvas.angle

    Rectangle
    {
        width: parent.width
        height: parent.height
        radius: (width + height) / 4
        color: "black"
    }

    Canvas {
        id: canvas
        property double angle: 0
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();

            var centreX = width / 2;
            var centreY = height / 2;

            ctx.beginPath();
            ctx.fillStyle = "green";
            ctx.moveTo(centreX, centreY);
            ctx.arc(centreX, centreY, width / 2, 0, canvas.angle, false);
            ctx.lineTo(centreX, centreY);
            ctx.fill();
        }
        onAngleChanged: requestPaint()
    }
}
