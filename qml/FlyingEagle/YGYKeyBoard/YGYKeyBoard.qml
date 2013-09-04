import QtQuick 2.0
import "js/script.js" as Tab
Item {
    id: keyboard
    z: 5
    width: 960
    height: 240

    state: "hide"
    anchors.horizontalCenter: parent.horizontalCenter

    anchors.bottom: parent.bottom
    anchors.bottomMargin: -240
    Loader {
        id: keyboardLoader
        anchors.fill: parent
        source: Tab.EnableVirtualKeyboard ? "English.qml" : ""
    }
    states: [ State { name: "show" }, State { name: "hide" } ]
    transitions: [
        Transition {
            from: "show"; to: "hide"
            PropertyAnimation { target: keyboard; properties: "anchors.bottomMargin"; to: "-240"; duration: 150; easing.type: Easing.InOutQuad; }
        },
        Transition {
            from: "hide"; to: "show"
            PropertyAnimation { target: keyboard; properties: "anchors.bottomMargin"; to: "0"; duration: 50; easing.type: Easing.InOutQuad;}
        }
    ]
}
