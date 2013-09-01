import QtQuick 2.0

Rectangle {
    width: 1280
    height: 95
    property url backgroundImage: ""

    Image {
        anchors.fill: parent
        source: !parent.backgroundImage ? parent.backgroundImage : "images/bar.png"
    }

    Image {
        x: 4
        y: 0
        width: 91
        height: 87
        anchors.leftMargin: 4
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.top: parent.top
        source: "images/qiege-bg.png"
    }

    RightPushButton {
        id: qiegeButton
        x: -1
        y: 8
        width: 100
        height: 74
        anchors.left: parent.left
        anchors.leftMargin: -1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 13
        //height: 80
        text: qsTr("切歌")
        textRightMargin: -20
        textBottomMargin: -12
        color: "transparent"
        backgroundNormal: "images/qiege.png"
        backgroundPressed: "images/qiegeSel.png"
    }

    Image {
        x: 6
        y: 3
        width: 90
        height: 90
        rotation: 0
        anchors.leftMargin: 6
        anchors.topMargin: 3
        anchors.left: parent.left
        anchors.top: parent.top
        source: "images/dsc_home_cateff.png"
    }

    RightPushButton {
        id: yuanchangButton
        anchors.left: qiegeButton.right
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        text: qsTr("原唱")
        backgroundNormal: "images/yuanchang.png"
        backgroundPressed: "images/yuanchangSel.png"
    }

    RightPushButton {
        id: zantingButton
        anchors.left: yuanchangButton.right
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        text: qsTr("暂停")
        backgroundNormal: "images/zanting.png"
        backgroundPressed: "images/zantingSel.png"
    }

    RightPushButton {
        id: chongchangButton
        anchors.left: zantingButton.right
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        text: qsTr("重唱")
        backgroundNormal: "images/chongchang.png"
        backgroundPressed: "images/chongchangSel.png"
    }

    RightPushButton {
        id: tiaoyinButton
        anchors.left: chongchangButton.right
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        text: qsTr("调音")
        backgroundNormal: "images/tiaoyin.png"
        backgroundPressed: "images/tiaoyinSel.png"
    }

    Slider {
        id: yinliangSlider
        anchors.left: tiaoyinButton.right
        anchors.leftMargin: 4
        anchors.top: parent.top
        anchors.topMargin: 42
        width: 154
        height: 38
    }

    RightPushButton {
        id: jingyinButton
        anchors.left: yinliangSlider.right
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        text: qsTr("静音")
        backgroundNormal: "images/jingyin.png"
        backgroundPressed: "images/jingyinSel.png"
    }

    RightPushButton {
        id: qifenButton
        anchors.left: jingyinButton.right
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        text: qsTr("气氛")
        backgroundNormal: "images/qifen.png"
        backgroundPressed: "images/qifenSel.png"
    }

    RightPushButton {
        id: fuzhuButton
        anchors.left: qifenButton.right
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        text: qsTr("辅助")
        backgroundNormal: "images/fuzhu.png"
        backgroundPressed: "images/fuzhuSel.png"
    }

    ProgressBar {
        id: jinduProgressBar
        anchors.left: fuzhuButton.right
        anchors.leftMargin: 150
        anchors.top: parent.top
        anchors.topMargin: 20
        width: 100
        height: 20
        color: "red"
        secondColor: "green"
    }
}
