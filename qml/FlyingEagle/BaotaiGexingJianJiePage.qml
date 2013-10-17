import QtQuick 2.0

Rectangle {
    id:baotai_gexing;
    width: 1280;
    height: 720;
    color: "transparent"
    property alias numpadVisible: numpad.visible;
    property alias singerInfoVisible: singerInfo.visible;
    property alias mv_previewVisible: mv_preview.visible;
    signal singerInfoCloseClicked();
    signal mvPreviewCloseClicked();
    signal confirmClicked();
    signal moreSongsCliecked();
    function showNumpad(title)
    {
        baotai_gexing.numpadVisible = true;
        baotai_gexing.singerInfoVisible = false;
        baotai_gexing.mv_previewVisible = false;
        baotai_gexing.visible = true;
        number_input.text = title;
    }
    function showSingerInfo(starname)
    {

        baotai_gexing.numpadVisible = false;
        baotai_gexing.singerInfoVisible = true;
        baotai_gexing.mv_previewVisible = false;
        baotai_gexing.visible = true;
    }
    function showMvPreview(mvname)
    {

        baotai_gexing.numpadVisible = false;
        baotai_gexing.singerInfoVisible = false;
        baotai_gexing.mv_previewVisible = true;
        baotai_gexing.visible = true;
    }


    //报台数字输入盘部分
    Rectangle {
        id: numpad;
        x: 510
        y: 131
        width: 302;
        height: 437;
        color: "transparent";
        Image {
            id: numpadBg;
            x: 0
            y: 8
            anchors.rightMargin: 0
            anchors.bottomMargin: -8
            anchors.leftMargin: 0
            anchors.topMargin: 8
            anchors.fill: parent;
            source: "images/baotai-bg.png";
        }

        Text {
            id: title;
            x: 97
            y: 19
            text: qsTr("请输入台号:")
            color: "white"
            style: Text.Normal
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
        }

        TextInput {
            id: number_input
            x: 22
            y: 81
            width: 258
            height: 42
            text: qsTr("123456")
            color: "white"
            font.pointSize: 30
            transformOrigin: Item.Center
            echoMode: TextInput.Normal
            horizontalAlignment: TextInput.AlignLeft

        }

        PushButton {
            id: num11
            x: 18
            y: 357
            colorText: "#ffffff"
            backgroundNormal: "images/baotai-delete.png"
        }

        PushButton {
            id: num10
            x: 119
            y: 357
            text: "0"
            colorText: "#ffffff"
            backgroundNormal: "images/baotai-num.png"
        }

        PushButton {
            id: num9
            x: 216
            y: 286
            text: "9"
            colorText: "#ffffff"
            backgroundNormal: "images/baotai-num.png"
        }

        PushButton {
            id: num8
            x: 119
            y: 286
            text: "8"
            colorText: "#ffffff"
            backgroundNormal: "images/baotai-num.png"
        }

        PushButton {
            id: num7
            x: 18
            y: 286
            text: "7"
            colorText: "#ffffff"
            backgroundNormal: "images/baotai-num.png"
        }

        PushButton {
            id: num6
            x: 216
            y: 212
            text: "6"
            colorText: "#ffffff"
            backgroundNormal: "images/baotai-num.png"
        }

        PushButton {
            id: num5
            x: 119
            y: 212
            text: "5"
            colorText: "#ffffff"
            backgroundNormal: "images/baotai-num.png"
        }

        PushButton {
            id: num4
            x: 18
            y: 212
            text: "4"
            colorText: "#ffffff"
            backgroundNormal: "images/baotai-num.png"
        }

        PushButton {
            id: num3
            x: 216
            y: 140
            width: 64
            text: "3"
            colorText: "#ffffff"
            anchors.rightMargin: 22
            backgroundNormal: "images/baotai-num.png"
            anchors.right: parent.right
        }

        PushButton {
            id: num2
            x: 119
            y: 140
            text: "2"
            colorText: "#ffffff"
            backgroundNormal: "images/baotai-num.png"
            anchors.leftMargin: 37
            anchors.left: num1.right
        }

        PushButton {
            id: num1
            x: 18
            y: 140
            text: "1"
            colorText: "#ffffff"
            backgroundNormal: "images/baotai-num.png"
            anchors.leftMargin: 18
            anchors.left: parent.left
        }

        PushButton {
            id: num12
            x: 216
            y: 357
            text: "确定"
            colorText: "#ffffff"
            backgroundNormal: "images/baotai-num.png"
            onClicked: {
                baotai_gexing.confirmClicked();
                baotai_gexing.visible=false;
            }
        }


    }


    //歌手简介页面部分
    Rectangle {
        id: singerInfo
        anchors.top: parent.top;
        anchors.topMargin: 164;
        anchors.left: parent.left
        anchors.leftMargin: 410;
        width: 470
        height: 440
        color: "transparent"
        Image {
            id: singerInfoBg;
            anchors.fill: parent;
            source: "images/singerinfobg.png";

            Image {
                id: image1
                x: 33
                y: 35
                width: 126
                height: 121
                source: "images/singergravatar.png"
            }

            Text {
                id: text1
                x: 196
                y: 35
                width: 206
                height: 23
                color: "#ffffff"
                text: qsTr("歌手资料:")
                style: Text.Normal
                styleColor: "#ffffff"
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 12
            }

            Text {
                id: text2
                x: 196
                y: 67
                width: 206
                height: 20
                color: "#ffffff"
                text: qsTr("中文名:徐若瑄")
                styleColor: "#ffffff"
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
                style: Text.Normal
            }

            Text {
                id: text3
                x: 196
                y: 87
                width: 206
                height: 18
                color: "#ffffff"
                text: qsTr("国籍:中国")
                styleColor: "#ffffff"
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
                style: Text.Normal
            }

            Text {
                id: text4
                x: 196
                y: 105
                width: 206
                height: 18
                color: "#ffffff"
                text: qsTr("出生地:台湾")
                styleColor: "#ffffff"
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
                style: Text.Normal
            }

            Text {
                id: text5
                x: 196
                y: 123
                width: 206
                height: 20
                color: "#ffffff"
                text: qsTr("星座:双子座")
                styleColor: "#ffffff"
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
                style: Text.Normal
            }


            Text {
                id: text6
                x: 196
                y: 143
                width: 206
                height: 20
                color: "#ffffff"
                text: qsTr("生日:1975年3月19日")
                styleColor: "#ffffff"
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 12
                style: Text.Sunken
            }

            Text {
                id: text7
                x: 33
                y: 188
                width: 94
                height: 23
                color: "#ffffff"
                text: "歌手简介:"
                wrapMode: Text.WordWrap
                styleColor: "#ffffff"
                font.pixelSize: 12
                verticalAlignment: Text.AlignTop
                style: Text.Normal
            }

            Text {
                id: text8
                x: 33
                y: 218
                width: 389
                height: 137
                color: "#ffffff"
                text: "歌手简介:\n\\t信息ini下"
                styleColor: "#ffffff"
                style: Text.Normal
                verticalAlignment: Text.AlignTop
                font.pixelSize: 12
                wrapMode: Text.WordWrap
            }

            PushButton {
                id: confirmButtonss
                x: 172
                y: 362
                width: 116
                height: 44
                text: "更多歌曲"
                colorText: "#ffffff"
                backgroundNormal: "images/moresongs.png"

                onClicked: {
                    baotai_gexing.moreSongsCliecked();
                }
            }

            PushButton {
                id: closeButton
                x: 430
                y: 0
                width: 40
                height: 40
                text: ""
                backgroundNormal: "images/del.png"
                colorText: "#ffffff"

                onClicked: {
                    baotai_gexing.singerInfoCloseClicked();
                    baotai_gexing.visible = false;
                }

            }
        }
    }

    //歌曲预览部分
    Rectangle {
        id: mv_preview;
        x: 320
        anchors.top: parent.top;
        anchors.topMargin: 74;
        width: 640; height: 518;
        Image {
            id: mv_preview_bg;
            anchors.fill: parent;
            source: "images/mv_preview_bg.png";
        }

        Rectangle {
            id:mv_preview_area;
            width:600;height: 400;
            anchors.top:parent.top;
            anchors.topMargin: 25;
            anchors.left: parent.left;
            anchors.leftMargin: 25;
            color: "black";
        }

        PushButton {
            id:mv_preview_top;
            width: 60;height: 60;
            anchors.top: mv_preview_area.bottom;
            anchors.topMargin: 25;
            anchors.left: parent.left;
            anchors.leftMargin: 184;
            backgroundNormal: "images/mv_preview_top.png";
        }
        PushButton {
            id:mv_preview_addplay;
            width: 70;height: 70;
            anchors.top: mv_preview_area.bottom;
            anchors.topMargin: 15;
            anchors.left: mv_preview_top.right;
            anchors.leftMargin: 50;
            backgroundNormal: "images/mv_preview_addplay.png";
        }
        PushButton {
            id:mv_preview_fav;
            width: 60;height: 60;
            anchors.top: mv_preview_area.bottom;
            anchors.topMargin: 25;
            anchors.right: parent.right;
            anchors.rightMargin: 184;
            backgroundNormal: "images/mv_preview_fav.png";
        }
        PushButton {
            id:mv_preview_close;
            x: 620
            y: -15
            width: 40;height: 40;
            backgroundNormal: "images/del.png";
            colorText: "#ffffff"
            onClicked: {
                baotai_gexing.mvPreviewCloseClicked();
                baotai_gexing.visible = false;
            }
        }
    }

}
