import QtQuick 2.0
import Fakekey 1.0
import ".."

Rectangle {
    id:zishuInputKeyboard;
    signal hideClicked();
    width: 693; height: 80;
    color: "transparent";
    Fakekey { id: _fakekey }
    Item { id: fakekey;
        function sendKey(s)
        {
            _fakekey.sendKey(s);
            console.log(s);
        }
    }
    MouseArea {
        anchors.fill: parent;
        onClicked: {
        }
    }
    Image {
        id: zishuInputBg;
        anchors.fill: parent;
        source: "images/zishu_input_bg.png"
    }
    Row {
        id: zishuRow
        anchors { top: parent.top; left: parent.left; leftMargin: 8; topMargin: 8 }
        spacing: 5;
        Repeater {
            model: ["一字", "二字", "三字", "四字", "五字", "六字", "多字"]
            PushButton {
                width:84;height: 54;
                backgroundNormal: "./images/zishu_button.png";
                text: modelData;
                onClicked: {
                    fakekey.sendKey(modelData);
                }
            }
        }
        PushButton {
            width:58;height: 54;
            backgroundNormal: "./images/std-keyboard.png";
            onClicked:
            {
                zishuInputKeyboard.hideClicked();
            }
        }
    }
}
