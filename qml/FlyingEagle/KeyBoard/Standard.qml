/*
 * 标准键盘输入法手写文件
 *
 * 开发团队: 月光涯信息科技有限公司
 * 官方网址: www.yueguangya.com
 *
**/
import QtQuick 2.0
import Fakekey 1.0
import ".."

Rectangle {
    id: standard_kbd
    property bool isShifted: false;
    property bool isPinyinMode: false;
    property variant candidates: ["候选1", "候选2", "候选3", "候选4", "候选5"];
    color: "transparent";
    signal numericClicked();
    signal zh_enClicked();
    signal handWritngClicked();
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
        spacing: 0
        Repeater {
            id: repeater0;
            model: candidates;
            PushButton {
                width:80;height: 56;
                text: modelData;
                backgroundNormal: "";
                onClicked: fakekey.sendKey(modelData)
            }
        }
        Rectangle{
            width:290;height: 56;
            color: "transparent";
            PushButton {
                id:priv;
                x:26;y:18;
                width:20;height: 23;
                backgroundNormal: "images/std-keyboard-left.png";
                onClicked:
                {
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
                }
            }
            PushButton {
                id: pinyin;
                anchors.left: next.right;
                anchors.leftMargin: 22;
                y:8;
                width:82;height: 40;
                backgroundNormal: "images/pinyinshouxie.png";
                text: "拼音";
                onClicked:
                {
                    standard_kbd.isPinyinMode = !standard_kbd.isPinyinMode;
                }
            }
            PushButton {
                id:shouxie;
                anchors.left: pinyin.right;
                anchors.leftMargin: 8;
                y:8;
                width:82;height: 40;
                backgroundNormal: "images/pinyinshouxie-no.png";
                text: "手写";
                onClicked:
                {
                    standard_kbd.handWritngClicked();
                }
            }
        }
    }




    Row {
        id: row1
        anchors { top: parent.top; left: parent.left; leftMargin: 5; topMargin: 62 }
        spacing: 8.3;
        Repeater {
            model: ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"]
            PushButton {
                width:54;height: 54;
                backgroundNormal: "./images/char-num-punct.png";
                text: isShifted ? modelData[0].toUpperCase() : modelData[0];
                onClicked: {
                    if (isShifted) { fakekey.sendKey(modelData[0].toUpperCase())}
                    else { fakekey.sendKey(modelData[0]); }
                }
            }
        }
        PushButton {
            width:58;height: 54;
            backgroundNormal: "./images/std-keyboard-del.png";
            onClicked: fakekey.sendKey(':backspace')
        }
    }

    Row {
        id: row2
        anchors { top: parent.top; left: parent.left; leftMargin: 30; topMargin: 120 }
        spacing: 8.3;
        Repeater {
            model: ["a", "s", "d", "f", "g", "h", "j", "k", "l"];
            PushButton {
                width:54;height: 54;
                backgroundNormal: "./images/char-num-punct.png";
                text: isShifted ? modelData[0].toUpperCase() : modelData[0];
                onClicked: {
                    if (isShifted) { fakekey.sendKey(modelData[0].toUpperCase())}
                    else { fakekey.sendKey(modelData[0]); }
                }
            }
        }
        PushButton {
            width:98;height: 54;
            text: "确定";
            backgroundNormal: "./images/std-keyboard-queding.png";
            onClicked: fakekey.sendKey(':enter')
        }
    }

    Row {
        id: row3
        anchors { top: parent.top; left: parent.left; leftMargin: 5; topMargin: 178 }
        PushButton {
            id:shift_button_left;
            width:50;height: 54;
            backgroundNormal: "./images/std-keyboard-up.png";
            onClicked: isShifted = !isShifted;
        }
        spacing: 10;
        Repeater {
            model: ["z", "x", "c", "v", "b", "n", "m",",!",".?"];
            PushButton {
                width:50;height: 54;
                backgroundNormal: "./images/char-num-punct.png";
                text: isShifted ? modelData.toUpperCase() : modelData;
                onClicked: {
                    if (index <= 6)
                    {
                        if (isShifted) { fakekey.sendKey(modelData[0].toUpperCase())}
                        else { fakekey.sendKey(modelData[0]); }
                    }else
                    {
                        if (isShifted) { fakekey.sendKey(modelData[1])}
                        else { fakekey.sendKey(modelData[0]); }
                    }
                }
            }
        }
        PushButton {
            id:shift_button_right;
            width:98;height: 54;
            backgroundNormal: "./images/std-keyboard-up.png";
            onClicked: isShifted = !isShifted;
        }
    }
    Row {
        id: row4
        anchors { top: parent.top; left: parent.left; leftMargin: 5; topMargin: 236 }
        spacing: 5;
        PushButton {
            id:num_button;
            width:103;height: 54;
            backgroundNormal: "./images/std-keyboard-zh-en-num.png";
            text: "123";
            onClicked:
            {
                standard_kbd.numericClicked();
            }
        }
        PushButton {
            id:zh_en_button;
            width:103;height: 54;
            backgroundNormal: "./images/std-keyboard-zh-en-num.png";
            text: "中英";
            onClicked: standard_kbd.zh_enClicked();
        }
        PushButton {
            id:space_button;
            width:300;height: 54;
            backgroundNormal: "./images/std-keyboard-space.png";
            onClicked: ;
        }
        PushButton {
            id:newline_button;
            width:103;height: 54;
            backgroundNormal: "./images/std-keyboard-zh-en-num.png";
            text: "换行";
            onClicked: ;
        }
        PushButton {
            id:keyboard_button;
            width:54;height: 54;
            backgroundNormal: "./images/std-keyboard.png";
            onClicked:
            {
                standard_kbd.hideClicked();
            }
        }
    }
}
