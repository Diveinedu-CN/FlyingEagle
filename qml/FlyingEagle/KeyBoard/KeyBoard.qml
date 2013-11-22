/*
 * 输入法页面文件
 *
 * 开发团队: 月光涯信息科技有限公司
 * 官方网址: www.yueguangya.com
 *
 * 功能: 歌曲搜索输入时候的手写输入法总入口控件,包含英文键盘,数字键盘,手写键盘
**/
import QtQuick 2.0
import "script.js" as Tab
Item {
    id: keyboard
    width: 693;
    height: 295;
    signal needHide();

    state: "hide"
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
    anchors.bottomMargin: -295
    MouseArea {
        anchors.fill: parent
        onClicked: ;
    }
    Item {
        id: keyboardsComponents
        Component {
            id: standardKeyboardComponent
            Standard {

            }
        }
        Component {
            id: handWritingKeyboardComponent
            HandWriting {

            }
        }
        Component {
            id: numericKeyboardComponent
            Numeric {

            }
        }
    }
    Rectangle {
        width: 693;
        height: 295;
        color: "transparent";
        MouseArea {
            anchors.fill: parent
            onClicked: ;
        }
        Loader {
            id: keyboardLoader
            anchors.fill: parent
            sourceComponent: standardKeyboardComponent;
        }
    }

    states: [ State { name: "show" }, State { name: "hide" } ]
    transitions: [
        Transition {
            from: "show"; to: "hide"
            PropertyAnimation { target: keyboard; properties: "anchors.bottomMargin"; to: -295; duration: 150; easing.type: Easing.InOutQuad; }
        },
        Transition {
            from: "hide"; to: "show"
            PropertyAnimation { target: keyboard; properties: "anchors.bottomMargin"; to: "0"; duration: 300; easing.type: Easing.InOutQuad;}
        }
    ]

    Connections {
        target: keyboardLoader.item
        ignoreUnknownSignals:true
        onNumericClicked: {
           keyboardLoader.sourceComponent = numericKeyboardComponent;
        }
        onStandardClicked: {
            keyboardLoader.sourceComponent = standardKeyboardComponent;
        }
        onHandWritngClicked: {
            keyboardLoader.sourceComponent = handWritingKeyboardComponent;
        }

        onHideClicked:
        {
            keyboard.state = "hide";
            keyboard.needHide();
        }
    }
    function showNumericKeyboard()
    {
        keyboardLoader.sourceComponent = numericKeyboardComponent;
    }

    function showEnglishKeyboard()
    {
        keyboardLoader.sourceComponent = standardKeyboardComponent;
    }
    function showHandWritingKeyboard()
    {
        keyboardLoader.sourceComponent = handWritingKeyboardComponent;
    }

}
