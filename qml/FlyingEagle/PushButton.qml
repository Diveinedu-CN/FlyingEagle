/*
 * 自定义按钮控件
 *
 * 开发团队: 月光涯信息科技有限公司
 * 官方网址: www.yueguangya.com
 *
 * 功能: 可以设置标题, 正常和按下状态的图片, 按钮颜色等属性
**/

import QtQuick 2.0


Rectangle {
    id: pushButton

    property alias text: label.text
    property url backgroundNormal: ""
    property url backgroundPressed: ""
    property url icon: ""
    property color colorNormal: "#a0a0a0"
    property color colorPressed: "#d0d0d0"
    property color colorText: "#000000"
    property int tag: 0

    signal clicked(Item item)

    width: 64
    height: 64
    smooth: true
    color: "#00000000"

    Image {
        id: bg
        width: parent.width;
        height: parent.height;
        visible: backgroundNormal != ""
        fillMode: Image.PreserveAspectFit
        source: backgroundNormal
        anchors.fill: parent
        antialiasing: true
        asynchronous: true
        opacity: maButton.pressed ? 0.8:1
        scale: maButton.pressed ? 0.9:1;
    }

    Image {
        id: iconImage
        visible: icon != ""
        source: icon
        anchors.fill: parent
        anchors.centerIn: parent
        antialiasing: true
        asynchronous: true
    }

    Text {
        id: label
        color: colorText
        //font.bold: true
        font.pixelSize: 20
        visible: text != ""
        anchors.centerIn: parent
    }

    MouseArea {
        id: maButton
        anchors.fill: parent

        onClicked: {
            parent.clicked(pushButton);
        }
    }

    function trash() {
        pushButton.destroy()
    }
}
