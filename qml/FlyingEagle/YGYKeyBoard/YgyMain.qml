import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtGraphicalEffects 1.0


Rectangle {
    width: 1280
    height: 720
    color: "grey"
    property alias  candidates: _textField.text;

    TextField {
        id:_textField
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 100
        maximumLength: 200
        placeholderText: qsTr("S搜(歌星/歌名/歌词)")

        style: TextFieldStyle {
            id:style
            textColor: "#FFFFFFFF"
            background: Rectangle {
                anchors.fill: parent
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                color: "black"
//                source: "images/searchbar.png"
            }
            panel:Item {
                anchors.fill: parent
                property font font
                property color textColor: style.textColor
                property color selectionColor: style.selectionColor
                property color selectedTextColor: style.selectedTextColor
                implicitWidth: 400;//backgroundLoader.implicitWidth ? backgroundLoader.implicitWidth : 100
                implicitHeight: 50;//backgroundLoader.implicitHeight ? backgroundLoader.implicitHeight : 20
                property color placeholderTextColor: Qt.rgba(1, 1, 1, 1)
                Loader {
                    id: backgroundLoader
                    sourceComponent: background
                    anchors.fill: parent
                }
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                _textField.forceActiveFocus();
                if(keyboard.state === "show")
                {
                    keyboard.state = "hide";
                }else
                {
                    keyboard.state = "show";
                }
            }
        }
    }

    YGYKeyBoard {
        id:keyboard
    }






}
