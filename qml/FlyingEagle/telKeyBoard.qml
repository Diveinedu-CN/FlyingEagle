import QtQuick 2.0

Item {
    width: 302
    height: 437

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

    Text {
        x: 27
        y: 77
        color: "#cabdbd"
        text: "请输入手机号码"
        font.pointSize: 24
    }

    PushButton{
        x: 19
        y: 133
        width: 63
        height: 63

        text: "1"
        colorText: "#ffffff"
        icon: "images/number.png"
    }

    PushButton{
        x: 120
        y: 133
        width: 63
        height: 63

        text: "2"
        colorText: "#ffffff"
        icon: "images/number.png"
    }

    PushButton{
        x: 219
        y: 133
        width: 63
        height: 63

        text: "3"
        colorText: "#ffffff"
        icon: "images/number.png"
    }

    PushButton{
        x: 19
        y: 207
        width: 63
        height: 63

        text: "4"
        colorText: "#ffffff"
        icon: "images/number.png"
    }

    PushButton{
        x: 120
        y: 207
        width: 63
        height: 63

        text: "5"
        colorText: "#ffffff"
        icon: "images/number.png"
    }
    PushButton{
        x: 219
        y: 207
        width: 63
        height: 63

        text: "6"
        colorText: "#ffffff"
        icon: "images/number.png"
    }

    PushButton{
        x: 19
        y: 283
        width: 63
        height: 63

        text: "7"
        colorText: "#ffffff"
        icon: "images/number.png"
    }

    PushButton{
        x: 120
        y: 283
        width: 63
        height: 63

        text: "8"
        colorText: "#ffffff"
        icon: "images/number.png"
    }

    PushButton{
        x: 219
        y: 283
        width: 63
        height: 63

        text: "9"
        colorText: "#ffffff"
        icon: "images/number.png"
    }

    PushButton{
        x: 19
        y: 358
        width: 63
        height: 63

//            text: "0"
        icon: "images/delete.png"
    }

    PushButton{
        x: 120
        y: 358
        width: 63
        height: 63

        text: "0"
        colorText: "#ffffff"
        icon: "images/number.png"
    }

    PushButton{
        x: 219
        y: 358
        width: 63
        height: 63

        text: "确定"
        colorText: "#ffffff"
        icon: "images/number.png"
    }
}
