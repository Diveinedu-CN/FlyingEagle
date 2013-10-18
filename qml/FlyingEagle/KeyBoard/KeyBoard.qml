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
    Rectangle {
        width: 693;
        height: 295;
        color: "transparent";
        Loader {
            id: keyboardLoader
            anchors.fill: parent
            source: Tab.EnableVirtualKeyboard ? "./Standard.qml" : ""
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
            keyboardLoader.setSource(Tab.EnableVirtualKeyboard ? "./Numeric.qml" : "");
        }
        onStandardClicked: {
            keyboardLoader.setSource(Tab.EnableVirtualKeyboard ? "./Standard.qml" : "");
        }
        onHandWritngClicked: {
            keyboardLoader.setSource(Tab.EnableVirtualKeyboard ? "./HandWriting.qml" : "");
        }

        onHideClicked:
        {
            keyboard.state = "hide";
            keyboard.needHide();
        }
    }
    function showNumericKeyboard()
    {
        keyboardLoader.setSource(Tab.EnableVirtualKeyboard ? "./Numeric.qml" : "");
    }

    function showEnglishKeyboard()
    {
        keyboardLoader.setSource(Tab.EnableVirtualKeyboard ? "./Standard.qml" : "");
    }
    function showHandWritingKeyboard()
    {
        keyboardLoader.setSource(Tab.EnableVirtualKeyboard ? "./HandWriting.qml" : "");
    }

}
