/*
 * 二次筛选输入法首拼键盘文件
 *
 * 开发团队: 月光涯信息科技有限公司
 * 官方网址: www.yueguangya.com
 *
**/
import QtQuick 2.0
import Fakekey 1.0
import ".."

Rectangle {
    id: shoupin_keyboard
    width: 693;
    height: 195;
    color: "transparent"
    signal hideClicked();
    MouseArea {
        anchors.fill: parent;
        onClicked: ;
    }

    Image {
        id:shoupin_bg
        anchors.fill: parent;
        source: "images/shoupin_bg.png";
    }
    Fakekey { id: _fakekey }
    Item { id: fakekey;
        function sendKey(s)
        {
            _fakekey.sendKey(s);
        }
    }
    Row {
        id: row1
        anchors { top: parent.top; left: parent.left; leftMargin: 5; topMargin: 10 }
        spacing: 8.3;
        Repeater {
            model: ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"]
            PushButton {
                width:54;height: 54;
                backgroundNormal: "./images/char-num-punct.png";
                text: modelData[0].toUpperCase();
                onClicked: {
                    fakekey.sendKey(modelData[0]);
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
        anchors { top: parent.top; left: parent.left; leftMargin: 30; topMargin: 68 }
        spacing: 8.3;
        Repeater {
            model: ["a", "s", "d", "f", "g", "h", "j", "k", "l"];
            PushButton {
                width:54;height: 54;
                backgroundNormal: "./images/char-num-punct.png";
                text:modelData[0].toUpperCase();
                onClicked: {
                   fakekey.sendKey(modelData[0].toUpperCase());
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
        anchors { top: parent.top; left: parent.left; leftMargin: 70; topMargin: 123 }
        spacing: 10;
        Repeater {
            model: ["z", "x", "c", "v", "b", "n", "m",",!",".?"];
            PushButton {
                width:50;height: 54;
                backgroundNormal: "./images/char-num-punct.png";
                text: modelData.toUpperCase();
                onClicked: {
                    if (index <= 6)
                    {
                        fakekey.sendKey(modelData[0].toUpperCase());
                    }else
                    {
                        fakekey.sendKey(modelData[0]);
                    }
                }
            }
        }
        PushButton {
            id:keyboard_button;
            width:54;height: 54;
            backgroundNormal: "./images/std-keyboard.png";
            onClicked:
            {
                shoupin_keyboard.hideClicked();//隐藏键盘
            }
        }
    }
}
