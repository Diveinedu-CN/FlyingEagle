import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
Item {
    width: 302
    height: 437

    signal confirmClicked();

    Image {
        anchors.fill: parent
        source: "images/loginBg.png"
    }

    Text {
        x: 129
        y: 16
        color: "#ffffff"
        text: "登陆"
        font.pointSize: 22
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    }

//    Text {
//        x: 27
//        y: 77
//        color: "#cabdbd"
//        text: "请输入手机号码"
//        font.pointSize: 24
//    }

    TextField {
        id: number_input
        x: 19
        y: 68
        width: 263
        height: 48
        placeholderText: qsTr("请输入手机号码")
        maximumLength: 11
        textColor: "#969696"
        font.pointSize: 24
        transformOrigin: Item.Center
        echoMode: TextInput.Normal
        horizontalAlignment: TextInput.AlignLeft
        clip: true
        style: TextFieldStyle {
            background: Rectangle {
                radius: 2
                implicitWidth: 258
                implicitHeight: 42
            }
        }
    }

    PushButton{
        x: 19
        y: 133
        width: 63
        height: 63

        text: "1"
        colorText: "#ffffff"
        backgroundNormal: "images/number.png"
        onClicked: number_input.text += text
    }

    PushButton{
        x: 118
        y: 133
        width: 63
        height: 63

        text: "2"
        colorText: "#ffffff"
        backgroundNormal: "images/number.png"
        onClicked: number_input.text += text
    }

    PushButton{
        x: 219
        y: 133
        width: 63
        height: 63

        text: "3"
        colorText: "#ffffff"
        backgroundNormal: "images/number.png"
        onClicked: number_input.text += text
    }

    PushButton{
        x: 19
        y: 207
        width: 63
        height: 63

        text: "4"
        colorText: "#ffffff"
        backgroundNormal: "images/number.png"
        onClicked: number_input.text += text
    }

    PushButton{
        x: 118
        y: 207
        width: 63
        height: 63

        text: "5"
        colorText: "#ffffff"
        backgroundNormal: "images/number.png"
        onClicked: number_input.text += text
    }
    PushButton{
        x: 219
        y: 207
        width: 63
        height: 63

        text: "6"
        colorText: "#ffffff"
        backgroundNormal: "images/number.png"
        onClicked: number_input.text += text
    }

    PushButton{
        x: 19
        y: 283
        width: 63
        height: 63

        text: "7"
        colorText: "#ffffff"
        backgroundNormal: "images/number.png"
        onClicked: number_input.text += text
    }

    PushButton{
        x: 118
        y: 283
        width: 63
        height: 63

        text: "8"
        colorText: "#ffffff"
        backgroundNormal: "images/number.png"
        onClicked: number_input.text += text
    }

    PushButton{
        x: 219
        y: 283
        width: 63
        height: 63

        text: "9"
        colorText: "#ffffff"
        backgroundNormal: "images/number.png"
        onClicked: number_input.text += text
    }

    PushButton{
        x: 19
        y: 358
        width: 63
        height: 63

//            text: "0"
        backgroundNormal: "images/delete.png"
        onClicked: number_input.remove(number_input.length-1,number_input.length);
    }

    PushButton{
        x: 118
        y: 358
        width: 63
        height: 63

        text: "0"
        colorText: "#ffffff"
        backgroundNormal: "images/number.png"
        onClicked: number_input.text += text
    }

    PushButton{
        x: 219
        y: 358
        width: 63
        height: 63
        enabled: (number_input.length==11)?true:false

        text: "确定"
        colorText: "#ffffff"
        backgroundNormal: "images/number.png"
        onClicked: {
            parent.confirmClicked()
        }
    }
}
