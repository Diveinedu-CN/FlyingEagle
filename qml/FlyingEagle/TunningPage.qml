import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
Rectangle {
    id: tunningItem
    x:0;y:0
    width: 1280
    height: 592
    color: "transparent"
    property alias tunningVisible: tunningPage.visible
    property alias qifenVisible: qifenPage.visible
    signal closeTunningClicked();
    signal closeQifenClicked();
    signal closeFuzhuClicked();
    //调音框
    Rectangle {
        id: tunningPage
        width: 478
        height: 254
        color: "transparent"
        visible: false
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: 200
        MouseArea {
            anchors.fill: parent
            onClicked: {

            }
        }

        Image {
            id: tuningBgImage
            anchors.fill: parent
            source: "images/dsc_tuning_gb.png"
        }
        PushButton {
            id: volumeAdd
            width: 46
            height: 32
            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.top: parent.top
            anchors.topMargin: 30
            backgroundNormal: "images/dsc_tuning_add.png"
        }

        PushButton {
            id: microphoneAdd
            x: 155
            y: 30
            width: 46
            height: 32
            backgroundNormal: "images/dsc_tuning_add.png"
            anchors.leftMargin: 155
            anchors.left: parent.left
            anchors.topMargin: 30
            anchors.top: parent.top
        }

        PushButton {
            id: volumeSub
            x: 50
            y: 164
            width: 46
            height: 32
            backgroundNormal: "images/dsc_tuning_sub.png"
            anchors.leftMargin: 50
            anchors.left: parent.left
            anchors.topMargin: 164
            anchors.top: parent.top
        }

        PushButton {
            id: microphoneSub
            x: 155
            y: 164
            width: 46
            height: 32
            backgroundNormal: "images/dsc_tuning_sub.png"
            anchors.leftMargin: 155
            anchors.left: parent.left
            anchors.topMargin: 164
            anchors.top: parent.top
        }

        Text {
            id: volumeText
            x: 50
            y: 202
            width: 46
            height: 22
            text: qsTr("音量")
            font.bold: false
            color: "white"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }

        Text {
            id: microphoneText
            x: 155
            y: 202
            width: 46
            height: 22
            color: "#ffffff"
            text: qsTr("麦克风")
            font.bold: false
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: effectText
            x: 235
            y: 35
            width: 46
            height: 22
            color: "#ffffff"
            text: qsTr("音效")
            font.pointSize: 22
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        ProgressBar {
            id: volumeProgress
            x: 64
            y: 67
            width: 14
            height: 90
            orientation: 0
            value: 0.8
            style: ProgressBarStyle {
                background: Image {
                    width: 14
                    height: 90
                    anchors.fill: parent
                    anchors.bottom: parent.bottom
                    source: "images/dsc_tuning_sback.png"
                }
                progress: Image {
                    width: 14
                    height: 90
                    anchors.fill: parent
                    anchors.bottom: parent.bottom
                    source: "images/dsc_tuning_sfront.png"
                }
            }
        }

        ProgressBar {
            id: microphoneProgress
            x: 169
            y: 67
            width: 14
            height: 90
            value: 0.8
            orientation: 0
            style: ProgressBarStyle {
                background: Image {
                    width: 14
                    height: 90
                    anchors.fill: parent
                    anchors.bottom: parent.bottom
                    fillMode: Image.Stretch
                    source: "images/dsc_tuning_sback.png"
                }
                progress: Image {
                    width: 14
                    height: 90
                    anchors.fill: parent
                    anchors.bottom: parent.bottom
                    fillMode: Image.Stretch
                    source: "images/dsc_tuning_sfront.png"
                }
            }
        }

        PushButton {
            id: specButton
            x: 235
            y: 73
            width: 86
            height: 50
            backgroundNormal: "images/dsc_tuning_spc.png"
            anchors.leftMargin: 235
            anchors.left: parent.left
            anchors.topMargin: 73
            anchors.top: parent.top
        }

        PushButton {
            id: rockButton
            x: 339
            y: 73
            width: 86
            height: 50
            backgroundNormal: "images/dsc_tuning_rock.png"
            anchors.leftMargin: 339
            anchors.left: parent.left
            anchors.topMargin: 73
            anchors.top: parent.top
        }

        PushButton {
            id: lyricButton
            x: 235
            y: 148
            width: 86
            height: 50
            backgroundNormal: "images/dsc_tuning_lyric.png"
            anchors.leftMargin: 235
            anchors.left: parent.left
            anchors.topMargin: 148
            anchors.top: parent.top
        }

        PushButton {
            id: popButton
            x: 339
            y: 148
            width: 86
            height: 50
            backgroundNormal: "images/dsc_tuning_pop.png"
            anchors.leftMargin: 339
            anchors.left: parent.left
            anchors.topMargin: 148
            anchors.top: parent.top
        }

        Text {
            id: volumeValueText
            x: 28
            y: 101
            width: 36
            height: 22
            color: "#ffffff"
            text: qsTr("100")
            font.pointSize: 14
            font.bold: false
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: microphoneValueText
            x: 134
            y: 101
            width: 35
            height: 22
            color: "#ffffff"
            text: qsTr("100")
            font.pointSize: 14
            font.bold: false
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        PushButton {
            id: closeButton
            x: 438
            y: -16
            width: 46
            height: 60
            backgroundNormal: "images/dsc_tuning_off.png"
            anchors.leftMargin: 438
            anchors.left: parent.left
            anchors.topMargin: -16
            anchors.top: parent.top
            onClicked: {
               parent.parent.closeTunningClicked();
            }
        }


    }

    //气氛框
    Rectangle {
        id: qifenPage
        width: 516
        height: 264
        color: "transparent"
        visible: false
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: 700
        MouseArea {
            anchors.fill: parent
            onClicked: {

            }
        }

        Image {
            id: qifenBgImage
            x: 0
            y: 0
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            source: "images/dsc_atmos_bg.png"
            fillMode: Image.Stretch
        }

        Text {
            id: audioEffectText
            x: 47
            y: 36
            width: 46
            height: 22
            color: "#ffffff"
            text: qsTr("声效")
            font.pointSize: 26
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: lightEffectText
            x: 277
            y: 34
            width: 46
            height: 22
            color: "#ffffff"
            text: qsTr("灯效")
            font.pointSize: 26
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
        }

        PushButton {
            id: handwrittenButton
            x: 101
            y: 28
            width: 122
            height: 38
            backgroundNormal: "images/dsc_atmos_sxzf.png"
            anchors.topMargin: 28
            anchors.leftMargin: 101
            anchors.left: parent.left
            anchors.top: parent.top
        }
        Rectangle {
            id: switchButton
            x: 341
            y: 28
            width: 122
            height: 38
            anchors.topMargin: 28
            anchors.leftMargin: 341
            anchors.top: parent.top
            anchors.left: parent.left
            color:"transparent"
            Image {
                id: switchbg
                width: 104
                height: 34
                anchors.fill: parent
                source: "images/dsc_atmos_inout.png"
            }
            Image {
                id: switchimg
                property int rightMargin: 0
                width: 48
                height: 38
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.right: parent.right
                anchors.rightMargin: rightMargin
                source: "images/dsc_atmos_button.png"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(switchimg.rightMargin==0)
                    {
                        switchimg.rightMargin = 70;
                    }else
                    {
                        switchimg.rightMargin = 0;
                    }
                }
            }
        }

        PushButton {
            id: gzButton
            x: 40
            y: 91
            width: 86
            height: 50
            backgroundNormal: "images/dsc_atmos_app.png"
            anchors.topMargin: 91
            anchors.leftMargin: 40
            anchors.left: parent.left
            anchors.top: parent.top
        }

        PushButton {
            id: dcButton
            x: 137
            y: 91
            width: 86
            height: 50
            backgroundNormal: "images/dsc_atmos_hoot.png"
            anchors.topMargin: 91
            anchors.leftMargin: 137
            anchors.left: parent.left
            anchors.top: parent.top
        }

        PushButton {
            id: hhButton
            x: 40
            y: 159
            width: 86
            height: 50
            backgroundNormal: "images/dsc_atmos_cheer.png"
            anchors.topMargin: 159
            anchors.leftMargin: 40
            anchors.left: parent.left
            anchors.top: parent.top
        }

        PushButton {
            id: ksButton
            x: 137
            y: 159
            width: 86
            height: 50
            backgroundNormal: "images/dsc_atmos_ks.png"
            anchors.topMargin: 159
            anchors.leftMargin: 137
            anchors.left: parent.left
            anchors.top: parent.top
        }

        PushButton {
            id: rgButton
            x: 277
            y: 91
            width: 86
            height: 50
            backgroundNormal: "images/dsc_atmos_rg.png"
            anchors.topMargin: 91
            anchors.leftMargin: 277
            anchors.left: parent.left
            anchors.top: parent.top
        }

        PushButton {
            id: dgButton
            x: 377
            y: 91
            width: 86
            height: 50
            backgroundNormal: "images/dsc_atmos_dyn.png"
            anchors.topMargin: 91
            anchors.leftMargin: 377
            anchors.left: parent.left
            anchors.top: parent.top
        }

        PushButton {
            id: sqButton
            x: 277
            y: 159
            width: 86
            height: 50
            backgroundNormal: "images/dsc_atmos_sq.png"
            anchors.topMargin: 159
            anchors.leftMargin: 277
            anchors.left: parent.left
            anchors.top: parent.top
        }

        PushButton {
            id: lxButton
            x: 377
            y: 159
            width: 86
            height: 50
            backgroundNormal: "images/dsc_tuning_pop.png"
            anchors.topMargin: 159
            anchors.leftMargin: 377
            anchors.left: parent.left
            anchors.top: parent.top
        }

        PushButton {
            id: closeQifenButton
            x: 476
            y: -16
            width: 46
            height: 60
            backgroundNormal: "images/dsc_tuning_off.png"
            anchors.topMargin: -16
            anchors.leftMargin: 476
            anchors.left: parent.left
            anchors.top: parent.top
            onClicked: {
               parent.parent.closeQifenClicked();
            }
        }
    }

}

