/*
 * 具有翻转效果的按钮, 绕中心轴旋转, 可以水平或者垂直方向旋转
 *
 * 开发团队: 月光涯信息科技有限公司
 * 官方网址: www.yueguangya.com
 *
 * 功能: 可以通过属性设置不同的翻转效果, 主要用于排行页和分类页的动画效果
**/

import QtQuick 2.0

Flipable {
    id: flipable

    property bool flipped: false
    //默认水平翻转
    property bool isHorizontal: true

    //正面的图片
    property url frontImage: ""

    //背面的图片
    property url backImage: ""
    property url image: ""

    //文字
    property alias text: _text.text

    //旋转角度
    property alias angle: rotation.angle

    //点击信号
    signal clicked

    implicitWidth: 80
    implicitHeight: 80

    front: Image {
        anchors.fill: parent

        source: frontImage
        fillMode: Image.PreserveAspectCrop
    }

    back: Image {
        anchors.fill: parent

        source: backImage
        fillMode: Image.PreserveAspectCrop
    }

    Image {
            anchors.fill: parent

            source: image
            fillMode: Image.PreserveAspectCrop
            //asynchronous: true
            sourceSize.width: parent.width
            sourceSize.height: parent.height
            opacity: maButton.pressed ? 0.8:1
            scale: maButton.pressed ? 0.9:1;
    }

    Text {
        id: _text
        anchors.centerIn: parent

        text: ""
        font.pixelSize: 20
    }

    transform: Rotation {
        id: rotation
        origin.x: flipable.width/2
        origin.y: flipable.height/2
        axis.x: isHorizontal? 0 : 1
        axis.y: isHorizontal? 1 : 0
        axis.z: 0
        angle: 0
    }

    states: State {
        name: "back"
        PropertyChanges {
            target: rotation
            angle: 180
        }
        when: flipable.flipped
    }

    transitions: Transition {
        NumberAnimation { target: rotation; property: "angle"; duration: 2000; easing.type: Easing.InOutQuad }
    }

    //点击后进行翻转动画
    MouseArea {
        id: maButton
        anchors.fill: parent
        onClicked: {
            flipable.flipped = !flipable.flipped

            parent.clicked()
        }
    }
}
