import QtQuick 2.0

import "js/shortstraw.js" as Straw
import "js/script.js" as Script

Canvas {
    id:canvas

    property int paintX
    property int paintY
    property int count: 0
    property int lineWidth: 5
    property variant drawColor: "black"

    property int strokes: 0

    MouseArea {
        id:mousearea
        hoverEnabled:true
        anchors.fill: parent
        onClicked: drawPoint()
        onPositionChanged:  {
            if (mousearea.pressed) {
                drawLineSegment();
                Script.addItem(mouseX, mouseY);
            }
            paintX = mouseX;
            paintY = mouseY;
        }

        onReleased: {
            var ctx = canvas.getContext('2d');
            var array = Straw.shortStraw(Script.getList());
            ctx.beginPath();
            ctx.strokeStyle = "red";
            ctx.lineWidth = 2;
            for (var i = 0; (i < array.length)&&array[i]; i++) {
                //console.log("strokes "+strokes+": " + array[i].x + ", "+ array[i].y );
                candidates = zinnia.query(strokes, array[i].x, array[i].y).split(" ");
                if (i>0)
                {
                    ctx.lineTo(array[i].x, array[i].y);
                }else if(i==0)
                {
                   ctx.moveTo(array[i].x, array[i].y);
                }
            }

            ctx.stroke();
            ctx.closePath();

            Script.clear();
            strokes++;
            requestPaint();
        }
    }

    function drawLineSegment() {
        var ctx = canvas.getContext('2d');
        ctx.beginPath();
        ctx.strokeStyle = "black";
        ctx.lineWidth = lineWidth;
        ctx.moveTo(paintX, paintY);
        ctx.lineTo(mousearea.mouseX, mousearea.mouseY);
        ctx.stroke();
        ctx.closePath();
        requestPaint();
    }

    function drawPoint() {
        var ctx = canvas.getContext('2d');
        ctx.lineWidth = lineWidth
        ctx.fillStyle = drawColor
        ctx.fillRect(mousearea.mouseX, mousearea.mouseY, 2, 2);
        requestPaint();
    }

    function clear() {
        var ctx = canvas.getContext('2d');
        strokes=0;
        candidates = [];
        zinnia.clear();
        ctx.clearRect(0, 0, width, height);
        requestPaint();
    }
    function clearCanvas() {
        var ctx = canvas.getContext('2d');
        strokes=0;
        zinnia.clear();
        ctx.clearRect(0, 0, width, height);
        requestPaint();
    }
}
