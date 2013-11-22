/*
 * 主文件
 *
 * 开发团队: 月光涯信息科技有限公司
 * 官方网址: www.yueguangya.com
 *
 * 功能: 页面上方的工具条, 通过handlerLoader信号传递需要调整到的页面
**/

import QtQuick 2.0

Rectangle {
    width: parent.width
    height: 60
    color: "#00000000"
    property alias fuwuButton: fuwuButton
    property alias fuwuText: fuwuText
    signal handlerLoader(string name, int index)

    //Logo, 点击后跳转到首页
    PushButton {
        id: logo
        anchors.leftMargin: 20
        width: 113
        height: 48
        backgroundNormal: "images/logo.png"

        onClicked: {
            handlerLoader("HomePage.qml", 0)
        }
    }

    //首页按钮, 点击后回到首页
    PushButton {
        id: mainButton
        anchors.topMargin: 4
        anchors.left: logo.right
        anchors.leftMargin: 4
        width: 41
        height: 40
        backgroundNormal: "images/home.png"
        backgroundPressed: "images/homeSel.png"

        onClicked: {
            handlerLoader("HomePage.qml", 0)
        }
    }

    Text {
        id: mainTitle
        text: qsTr("首页")
        anchors.left: mainButton.right
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        color: "#FFFFFF"
        font.pixelSize: 24
    }

    //首页文字按钮, 点击回到首页
    PushButton {
        anchors.left: mainButton.right
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        width: 60
        height: 40

        onClicked: {
            handlerLoader("HomePage.qml", 0)
        }
    }

    //服务按钮, 点击弹出服务窗口
    PushButton {
        id: fuwuButton
        anchors.topMargin: 4
        anchors.left: mainTitle.right
        anchors.leftMargin: 4
        width: 41
        height: 40
        backgroundNormal: "images/fuwu.png"
        backgroundPressed: "images/fuwuSel.png"
    }

    Text {
        text: qsTr("服务")
        anchors.left: fuwuButton.right
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        color: "#FFFFFF"
        font.pixelSize: 24
    }

    //服务文字按钮, 点击弹窗服务窗口
    PushButton {
        id: fuwuText
        anchors.left: fuwuButton.right
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        width: 60
        height: 40
    }
}
