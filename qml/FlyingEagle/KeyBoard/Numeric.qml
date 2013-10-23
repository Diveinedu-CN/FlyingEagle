import QtQuick 2.0
import Fakekey 1.0
import ".."

Rectangle {
    id: numeric_kbd
    property bool isShifted: false
    property variant candidates: [];
    color: "transparent";
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
        anchors.topMargin: 55;
        source: "./images/numeric-keyboard-bg.png"
        asynchronous: true
        sourceSize.width: parent.width
        sourceSize.height: parent.height
    }




    Row {
        id: row1
        anchors { top: parent.top; left: parent.left; leftMargin: 5; topMargin: 62 }
        spacing: 8.3;
        Repeater {
            model: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
            PushButton {
                width:54;height: 54;
                backgroundNormal: "./images/char-num-punct.png";
                text: modelData[0];
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
        anchors { top: parent.top; left: parent.left; leftMargin: 30; topMargin: 120 }
        spacing: 8.3;
        Repeater {
            model: ["-", "/", ":", ";", "(", ")", "$", "&", "@"];
            PushButton {
                width:54;height: 54;
                backgroundNormal: "./images/char-num-punct.png";
                text: modelData[0];
                onClicked: {
                   fakekey.sendKey(modelData[0]);
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
            model: ["%", "~", ".", ",", "?", "!", "'","\"","#"];
            PushButton {
                width:50;height: 54;
                backgroundNormal: "./images/char-num-punct.png";
                text:  modelData[0];
                onClicked: {
                    fakekey.sendKey(modelData[0]);
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
            id:abc_button;
            width:210;height: 54;
            backgroundNormal: "./images/numeric-keyboard-abc.png";
            text: "ABC";
            onClicked:
            {
                numeric_kbd.standardClicked();
            }
        }
        PushButton {
            id:space_button;
            width:300;height: 54;
            backgroundNormal: "./images/std-keyboard-space.png";
            onClicked: fakekey.sendKey(" ");
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
                numeric_kbd.hideClicked();
            }
        }
    }
}
