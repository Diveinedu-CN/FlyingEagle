import QtQuick 2.0

Rectangle {
    width: parent.width
    height: 60
    color: "#00000000"

    Image {
        id: logo
        anchors.leftMargin: 20
        width: 160
        height: 60
        source: "images/logo.png"
    }

    PushButton {
        id: mainButton
        anchors.topMargin: 4
        anchors.left: logo.right
        anchors.leftMargin: 4
        width: 50
        height: 50
        backgroundNormal: "images/home.png"
        backgroundPressed: "images/homeSel.png"
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

    PushButton {
        id: fuwuButton
        anchors.topMargin: 4
        anchors.left: mainTitle.right
        anchors.leftMargin: 4
        width: 50
        height: 50
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
}
