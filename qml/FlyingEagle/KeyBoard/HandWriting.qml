import QtQuick 2.0
import Fakekey 1.0
import Zinnia 1.0
import ".."
import "shortstraw.js" as Straw
import "script.js" as Script

Rectangle {
    id: handwriting_kbd
    property bool isShifted: false
    property int displayCandidatesIndex:0;
    property variant candidates: ["候选1", "候选2", "候选3", "候选4", "候选5"];
    property variant displayCandidates: ["候选1", "候选2", "候选3", "候选4", "候选5"];
    color: "transparent";
    signal numericClicked();
    signal standardClicked();
    signal hideClicked();

    Fakekey { id: _fakekey }
    Item { id: fakekey;
        function sendKey(s)
        {
            _fakekey.sendKey(s);
        }
    }
    Image {
        id: stdkbd_bg;
        anchors { left: parent.left; top: parent.top }
        source: "./images/std-keyboard-bg.png"
        asynchronous: true
        sourceSize.width: parent.width
        sourceSize.height: parent.height
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
                onClicked: fakekey.sendKey(modelData)
            }
        }
    }
    Rectangle{
        width:290;height: 56;
        anchors { top: parent.top; right: parent.right; rightMargin: 5; topMargin: 0 }
        color: "transparent";
        PushButton {
            id:priv;
            x:26;y:18;
            width:20;height: 23;
            backgroundNormal: "images/std-keyboard-left.png";
            onClicked:
            {
                displayCandidatesIndex -= 5;
                if(displayCandidatesIndex>=0)
                {
                    displayCandidates = candidates.slice(displayCandidatesIndex,displayCandidatesIndex+5);
                }
            }
        }
        PushButton {
            id:next;
            anchors.left: priv.right;
            anchors.leftMargin: 26;
            y:18;
            width:20;height: 23;
            backgroundNormal: "images/std-keyboard-right.png";
            onClicked:
            {
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
        PushButton {
            id: pinyin;
            anchors.left: next.right;
            anchors.leftMargin: 22;
            y:8;
            width:82;height: 40;
            backgroundNormal: "images/pinyinshouxie-no.png";
            text: "拼音";
            onClicked:
            {
                handwriting_kbd.standardClicked();
            }
        }
        PushButton {
            id:shouxie;
            anchors.left: pinyin.right;
            anchors.leftMargin: 8;
            y:8;
            width:82;height: 40;
            backgroundNormal: "images/pinyinshouxie.png";
            text: "手写";
            onClicked:
            {
            }
        }
    }






        PushButton {
            id: backspace_button;
            width:58;height: 54;
            anchors.top: parent.top;
            anchors.topMargin: 62;
            anchors.right: parent.right;
            anchors.rightMargin: 5;
            backgroundNormal: "./images/std-keyboard-del.png";
            onClicked: fakekey.sendKey(':backspace')
        }
        PushButton {
            width:74;height: 54;
            anchors.top: parent.top;
            anchors.topMargin: 62;
            anchors.right: backspace_button.left;
            anchors.rightMargin: 5;
            backgroundNormal: "./images/handwritng-keyboard-rewrite.png";
            text: "重写"
            onClicked: {
                canvas.clear();
            }
        }
        PushButton {
            id: confirm_button;
            width:138;height: 54;
            anchors.top: parent.top;
            anchors.topMargin: 120;
            anchors.right: parent.right;
            anchors.rightMargin: 5;
            backgroundNormal: "./images/handwriting-keyboard-confirm-space.png";
            text : "确认"
            onClicked: fakekey.sendKey(':enter');
        }
        PushButton {
            id: space_button;
            width:138;height: 54;
            anchors.top: parent.top;
            anchors.topMargin: 178;
            anchors.right: parent.right;
            anchors.rightMargin: 5;
            backgroundNormal: "./images/handwriting-keyboard-confirm-space.png";
            text : "空格"
            onClicked: fakekey.sendKey(' ');
        }



        PushButton {
            id:num_button;
            width:80;height: 54;
            anchors.top: parent.top;
            anchors.topMargin: 236;
            anchors.right: parent.right;
            anchors.rightMargin: 64;
            backgroundNormal: "./images/handwriting-keyboard-123.png";
            text: "123";
            onClicked:
            {
                handwriting_kbd.numericClicked();
            }
        }


        PushButton {
            id:keyboard_button;
            width:54;height: 54;
            anchors.top: parent.top;
            anchors.topMargin: 236;
            anchors.right: parent.right;
            anchors.rightMargin: 5;
            backgroundNormal: "./images/std-keyboard.png";
            onClicked:
            {
                handwriting_kbd.hideClicked();
            }
        }


        Rectangle {
            id:strokeArea;
            anchors.top:parent.top;
            anchors.topMargin: 62;
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
