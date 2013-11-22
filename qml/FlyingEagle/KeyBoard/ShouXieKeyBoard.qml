/*
 * 二次筛选输入法手写文件
 *
 * 开发团队: 月光涯信息科技有限公司
 * 官方网址: www.yueguangya.com
 *
**/
import QtQuick 2.0
import Fakekey 1.0
import Zinnia 1.0
import ".."
import "shortstraw.js" as Straw
import "script.js" as Script

Rectangle {
    id: shouxie_keyboard
    width: 611;
    height: 309;
    color: "transparent";
    signal hideClicked();
    property int displayCandidatesIndex:0;
    property variant candidates: ["候选1", "候选2", "候选3", "候选4", "候选5"];
    property variant displayCandidates: ["候选1", "候选2", "候选3", "候选4", "候选5"];
    Fakekey { id: _fakekey }
    Item { id: fakekey;
        function sendKey(s)
        {
            _fakekey.sendKey(s);
        }
    }
    MouseArea {
        anchors.fill: parent;
        onClicked: ;
    }

    Image {
        id: shouxie_keyboard_bg;
        anchors.fill: parent;
        source: "images/filter_shouxie_bg.png";
    }
    Row {
        id: row0
        anchors { top: parent.top; left: parent.left; leftMargin: 0; topMargin: 0 }
        width:693;
        spacing: 0;
        Repeater {
            id: repeater0;
            model: displayCandidates;
            PushButton {
                width:80;height: 56;
                text: modelData;
                backgroundNormal: "";
                onClicked: {
                    canvas.clear();
                    fakekey.sendKey(modelData)
                }
            }
        }
    }
    Rectangle{
        width:85;height: 56;
        anchors { top: parent.top; right: parent.right; rightMargin: 50; topMargin: 0 }
        color: "transparent";
        PushButton {
            id:priv;
            x:26;y:18;
            width:20;height: 23;
            anchors.right: next.left;
            anchors.rightMargin: 45;
            backgroundNormal: "images/std-keyboard-left.png";
            onClicked:
            {
                //候选词分页
                displayCandidatesIndex -= 5;
                if(displayCandidatesIndex>=0)
                {
                    displayCandidates = candidates.slice(displayCandidatesIndex,displayCandidatesIndex+5);
                }
            }
        }
        PushButton {
            id:next;
            anchors.right: parent.right;
            anchors.rightMargin: 0;
            y:18;
            width:20;height: 23;
            backgroundNormal: "images/std-keyboard-right.png";
            onClicked:
            {
                //候选词分页
                var leftCount = candidates.length - displayCandidatesIndex - 5;
                if (leftCount>5)
                {
                    displayCandidatesIndex += 5
                    displayCandidates = candidates.slice(displayCandidatesIndex,displayCandidatesIndex+5);
                }else if (leftCount > 0)
                {
                    displayCandidatesIndex += 5
                    displayCandidates = candidates.slice(displayCandidatesIndex,candidates.length);
                }
            }
        }

    }


    Rectangle {
        id: colum0;
        anchors { bottom: parent.bottom; right: parent.right; rightMargin: 10; bottomMargin: 20 }
        width: 54;
        height: 230;
        color: "transparent";
        PushButton {
            id:rewrite;
            width:54;height: 72;
            anchors.top: parent.top;
            anchors.topMargin: 3;
            text: "重写";
            backgroundNormal: "images/filter_shouxie_rewrite.png";
            onClicked: {
                canvas.clear();
            }
        }
        PushButton {
            id: backspace;
            width:54;height: 72;
            anchors.top: rewrite.bottom;
            anchors.topMargin: 5;
            text: "";
            backgroundNormal: "images/filter_shouxie_backspace.png";
            onClicked: fakekey.sendKey(":backspace");
        }
        PushButton {
            id: hide;
            anchors.top: backspace.bottom;
            anchors.topMargin: 5;
            width:54;height: 72;
            text: "";
            backgroundNormal: "images/filter_shouxie_hide.png";
            onClicked: shouxie_keyboard.hideClicked();
        }

    }


    Rectangle {
        id:strokeArea;
        anchors.bottom:colum0.bottom;
        anchors.bottomMargin: 0;
        anchors.left: parent.left;
        anchors.leftMargin: 8;
        width: 535;height:228;
        color: "transparent";
        Image {
            id: strokeAreaBg;
            anchors.fill: parent;
            source: "images/handwriting-keyboard-area.png";
        }

        Canvas {
            id:canvas

            property int paintX
            property int paintY
            property int count: 0
            property int lineWidth: 5
            property variant drawColor: "black"

            property int strokes: 0
            anchors.fill: parent;
            MouseArea {
                id:mousearea
                hoverEnabled:true
                anchors.fill: parent
                onClicked: canvas.drawPoint()
                onPositionChanged:  {
                    if (mousearea.pressed) {
                        canvas.drawLineSegment();
                        Script.addItem(mouseX, mouseY);
                    }
                    canvas.paintX = mouseX;
                    canvas.paintY = mouseY;
                }

                onReleased: {
                    var ctx = canvas.getContext('2d');
                    var array = Straw.shortStraw(Script.getList());
                    ctx.beginPath();
                    ctx.strokeStyle = "red";
                    ctx.lineWidth = 2;
                    for (var i = 0; (i < array.length)&&array[i]; i++) {
                        //把存在数组里的笔画.调用手写引擎对象去查询结果
                        candidates = zinnia.query(canvas.strokes, array[i].x, array[i].y).split(" ");
                        displayCandidates = candidates.slice(0,5);
                        displayCandidatesIndex=0;
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
                    canvas.strokes++;
                    canvas.requestPaint();
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
                canvas.requestPaint();
            }

            function drawPoint() {
                var ctx = canvas.getContext('2d');
                ctx.lineWidth = lineWidth
                ctx.fillStyle = drawColor
                ctx.fillRect(mousearea.mouseX, mousearea.mouseY, 2, 2);
                canvas.requestPaint();
            }

            function clear() {
                var ctx = canvas.getContext('2d');
                strokes=0;
                candidates = [];
                zinnia.clear();
                ctx.clearRect(0, 0, width, height);
                canvas.requestPaint();
            }
            function clearCanvas() {
                var ctx = canvas.getContext('2d');
                strokes=0;
                zinnia.clear();
                ctx.clearRect(0, 0, width, height);
                canvas.requestPaint();
            }
        }

        Zinnia {
            id: zinnia
            width:canvas.width
            height:canvas.height
        }
    }


}
