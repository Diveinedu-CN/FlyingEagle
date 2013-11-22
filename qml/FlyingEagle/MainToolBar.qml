/*
 * 主文件
 *
 * 开发团队: 月光涯信息科技有限公司
 * 官方网址: www.yueguangya.com
 *
 * 功能: 页面下方的工具条, 所有的控制按钮都位于这个工具条上
**/

import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Particles 2.0

Rectangle {
    id: rectangle1
    width: 1280
    height: 95
    property url backgroundImage: ""
    property alias yixuanQiPao: yixuanQipao
    property alias yixuanButton: yixuanButton
    property alias tiaoyinButton: tiaoyinButton
    property alias qifenButton: qifenButton
    property alias fuzhuButton: fuzhuButton

    Image {
        anchors.fill: parent
        source: !parent.backgroundImage ? parent.backgroundImage : "images/bar.png"
    }

    //切歌图片
    Image {
        x: 10
        y: 1
        width: 82
        height: 80
        anchors.leftMargin: 10
        anchors.topMargin: 1
        anchors.left: parent.left
        anchors.top: parent.top
        source: "images/qiege-bg.png"
    }

    //火焰图片
    Image {
        id:huoyanImage
        x: 15
        y: 9
        width: 70
        height: 67
        rotation: 0
        anchors.leftMargin: 15
        anchors.topMargin: 9
        anchors.left: parent.left
        anchors.top: parent.top
        source: "images/dsc_home_cateff.png"
//        source:"images/qiege_huoyan.png"

        //火焰旋转动画
        SequentialAnimation {
            id: huoyanAnimation
            loops: Animation.Infinite
            //first circle
            PropertyAnimation {
                target: huoyanImage;
                property: "rotation"
                from: 0
                to: 360;
                duration: 4000;
            }
            //second circle
            ParallelAnimation {
                PropertyAnimation {
                    target: huoyanImage;
                    property: "rotation"
                    from: 0
                    to: 360;
                    duration: 4000;
                }
                SequentialAnimation {
                    PropertyAnimation {
                        target: huoyanImage
                        property: "opacity"
                        from:1
                        to:0
                        duration: 2000;
                    }
                    PauseAnimation { duration: 2000 }
                }
            }
            //third circle
            ParallelAnimation {
                PropertyAnimation {
                    target: huoyanImage;
                    property: "rotation"
                    from: 0
                    to: 360;
                    duration: 4000;
                }
                SequentialAnimation {
                    PropertyAnimation {
                        target: huoyanImage
                        property: "opacity"
                        from:0
                        to:1
                        duration: 2000;
                    }
                    PauseAnimation { duration: 2000 }
                }
            }
        }
        Component.onCompleted: huoyanAnimation.start();
    }

    //切歌按钮
    RightPushButton {
        id: qiegeButton
        x: 20
        y: 11
        width: 100
        height: 74
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        //height: 80
        text: qsTr("切歌")
        textBottomMargin: 0
        color: "transparent"
        backgroundNormal: "images/qiege.png"
    }

    //原唱, 伴唱切换按钮
    RightPushButton {
        id: yuanchangButton
        property bool isOrign: true;
        anchors.left: qiegeButton.right
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        text: isOrign? qsTr("原唱") : qsTr("伴唱");
        backgroundNormal: isOrign?"images/yuanchang.png":"images/banchang.png";
        onClicked: isOrign = !isOrign;
    }

    //播放, 暂停按钮
    RightPushButton {
        id: zantingButton
        property bool isPlaying: true;
        anchors.left: yuanchangButton.right
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        text: isPlaying? qsTr("暂停") : qsTr("播放");
        backgroundNormal: isPlaying ? "images/zanting.png" : "images/bofang.png";
        onClicked: isPlaying = !isPlaying;
    }

    //重唱按钮
    RightPushButton {
        id: chongchangButton
        anchors.left: zantingButton.right
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        text: qsTr("重唱")
        backgroundNormal: "images/chongchang.png"
    }

    //调音按钮
    RightPushButton {
        id: tiaoyinButton
        anchors.left: chongchangButton.right
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        text: qsTr("调音")
        backgroundNormal: "images/tiaoyin.png"
        backgroundPressed: "images/tiaoyinSel.png"
    }

    //音量调节滑动条
    Slider {
        id: yinliangSlider
        x: 540
        y: 46
        width: 160
        anchors.left: tiaoyinButton.right
        anchors.leftMargin: 6
        anchors.top: parent.top
        anchors.topMargin: 46
        height: 38

        style: SliderStyle {
            groove: Image {
                source: "images/tuning_sfront.png"
            }
            handle: Image {
                y: 2
                width: 25;
                height: 25
                scale: 1.5
                source: "images/buttom.png"
            }
        }
    }

    //静音, 开启按钮
    RightPushButton {
        id: jingyinButton
        property bool isMuted: false;
        anchors.left: yinliangSlider.right
        anchors.leftMargin: 6
        anchors.bottom: parent.bottom
        text: isMuted?qsTr("静音"):qsTr("开启")
        backgroundNormal: isMuted?"images/jingyin.png":"images/kaiqi.png"
        onClicked: isMuted = !isMuted;
    }

    //气氛按钮
    RightPushButton {
        id: qifenButton
        anchors.left: jingyinButton.right
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        text: qsTr("气氛")
        backgroundNormal: "images/qifen.png"
    }

    //辅助按钮
    RightPushButton {
        id: fuzhuButton
        anchors.left: qifenButton.right
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        text: qsTr("辅助")
        backgroundNormal: "images/fuzhu.png"
    }

    //播放进度条
    Rectangle {
        id: jinduProgressBar
        property real progressValue: 0.5
        anchors.left: fuzhuButton.right
        anchors.leftMargin: 6
        anchors.top: parent.top
        anchors.topMargin: 42
        width: 180/*110*/
        height: 41
        color: "transparent"
        clip: true
        SequentialAnimation {
            id: progressAnimation
            loops: Animation.Infinite
            PropertyAnimation {
                target: jinduProgressBar;
                property: "progressValue"
                from: 0
                to: 1;
                duration: 4000;
            }
        }
        Component.onCompleted: progressAnimation.start()
        Image {
            anchors.fill: parent
            source: "images/sliderBg.png"
        }
        Rectangle{
            id: progressbar
            x: 21
            width: 152
            height: 26
            clip: true
            anchors.left: parent.left;
            anchors.leftMargin: 21
            anchors.top: parent.top
            anchors.topMargin: 7
            color: "transparent"
            Rectangle{
                id: progress
                x: 8
                y: 0
                width: 152
                height: 26
                clip: false
                anchors.right: parent.right
                anchors.rightMargin: (1-jinduProgressBar.progressValue)*120;
                color: "transparent"
                Image {
                    id:progressImg1
                    anchors.right: progressImg2.left
                    anchors.rightMargin: 0
                    width: 142;
                    height: 26;
                    source: "images/sliderFg.png"
                    clip: true;

                    //气泡粒子效果
                    ParticleSystem {
                        id: particles
                    }

                    //气泡图片
                    ImageParticle {
                        system: particles
                        source: "images/jindu-qipao1.png"
                    }

                    //粒子发射器
                    Emitter {
                        anchors.fill: progressImg1
                        system: particles
                        emitRate: 5
                        lifeSpan: 4000
                        velocity: PointDirection { y:-4; yVariation: 4; }
                        acceleration: PointDirection { y: 4 }
                        size: 13
                        endSize: 5
                        sizeVariation: 0
                    }
                }

                //半圆图片
                Image {
                    id:progressImg2
                    anchors.right: parent.right;
                    width: 10
                    height: 26;
                    source: "images/sliderFgRadius.png"
                }
            }

    }

    }
    PushButton {
        id: mvButtonBg
        anchors.left: fuzhuButton.right
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        backgroundNormal: "images/MV-Button-Bg.png"
    }
    PushButton {
        id: mvButton
        anchors.left: fuzhuButton.right
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        backgroundNormal: "images/MV-button.png"
    }

    PushButton {
        id: yixuanButton
        anchors.left: jinduProgressBar.right
        anchors.leftMargin: 10
        anchors.bottomMargin: 4
        anchors.bottom: parent.bottom
        text: qsTr("已 选")
        colorText: "#FFFFFFFF"
        backgroundNormal: "images/yixuan.png"
    }

    /*已选按钮上的气泡*/
    Button {
        id: yixuanQipao
        width:50;height: 50;
        anchors.right: parent.right
        anchors.topMargin: 10
        Text {
            anchors.fill: parent
            anchors.topMargin: 8
            horizontalAlignment: Text.AlignHCenter
            text: qsTr("99+")
            font.pixelSize:16
            font.bold: true
            color: "white"
        }

        style: ButtonStyle {
            background: Image {
                anchors.fill: parent
                anchors.bottomMargin: -10
                source:"images/qipao2.png"
            }
            SystemPalette {
            }
        }
    }

}
