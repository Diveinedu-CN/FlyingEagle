import QtQuick 2.0

Rectangle {
    id: udiskAddPage

    width: 1090
    height: 586
    signal udiskCloseClicked();
    color: "transparent"
    MouseArea {
        anchors.fill: parent;
        onClicked: {

        }
    }

    Rectangle {
        id:udiskAddList
        anchors.fill: parent;
        color: "transparent"
        visible: false;
        Image {
            id: udiskAddListBg
            anchors.fill: parent;
            source: "images/udiskAddbg.png"
        }
        Image {
            id: selectedType;
            x: 65
            y: 456
            width: 150; height: 60;
            source: "images/udiskAddxuanzhong.png";
            Behavior on y {
                NumberAnimation { easing.amplitude: 5; easing.type: Easing.OutInBack; duration: 100 }
            }
        }
        Column {
            id: mediaTypeColumn;
            x: 61
            y: 36
            spacing: 15;
            Rectangle {
                id: shipin;
                width: 158;
                height: 158;
                color: "transparent"
                MouseArea {
                    anchors.fill: parent;
                    onClicked: selectedType.y = 114;
                }

                Image {
                    id: shipinimg;
                    width: 100;
                    height: 100;
                    anchors.top: parent.top;
                    anchors.left: parent.left;
                    anchors.topMargin: 20;
                    anchors.leftMargin: 30;
                    source: "images/udiskAddshipin.png";
                }
                Text {
                    id: shipinText;
                    anchors.top: shipinimg.bottom;
                    anchors.topMargin: 10;
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("视频")
                    font.pixelSize: 24
                    color: "white"
                }
            }
            Rectangle {
                id: yinyue;
                width: 158;
                height: 158;
                color: "transparent"
                MouseArea {
                    anchors.fill: parent;
                    onClicked: selectedType.y = 284;
                }
                Image {
                    id: yinyueimg;
                    width: 100;
                    height: 100;
                    anchors.top: parent.top;
                    anchors.left: parent.left;
                    anchors.topMargin: 20;
                    anchors.leftMargin: 30;
                    source: "images/udiskAddyinyue.png";
                }
                Text {
                    id: yinyueText
                    anchors.top: yinyueimg.bottom;
                    anchors.topMargin: 10;
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("音乐")
                    font.pixelSize: 24
                    color: "white"
                }
            }
            Rectangle {
                id: tupian;
                width: 158;
                height: 158;
                color: "transparent"
                MouseArea {
                    anchors.fill: parent;
                    onClicked: selectedType.y = 456;
                }
                Image {
                    id: tupianimg;
                    width: 100;
                    height: 100;
                    anchors.top: parent.top;
                    anchors.left: parent.left;
                    anchors.topMargin: 20;
                    anchors.leftMargin: 30;
                    source: "images/udiskAddtupian.png";
                }
                Text {
                    id: tupianText
                    anchors.top: tupianimg.bottom;
                    anchors.topMargin: 10;
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("图片")
                    font.pixelSize: 24
                    color: "white"
                }
            }

        }

        ListModel {
            id: meidaListModel;

            ListElement {
                medianame: "Apple"
                mediaId: 1
            }
            ListElement {
                medianame: "Orange"
                mediaId: 2
            }
            ListElement {
                medianame: "Banana"
                mediaId: 3
            }
            ListElement {
                medianame: "Apple"
                mediaId: 1
            }
            ListElement {
                medianame: "Orange"
                mediaId: 2
            }
            ListElement {
                medianame: "Banana"
                mediaId: 3
            }
            ListElement {
                medianame: "Apple"
                mediaId: 1
            }
            ListElement {
                medianame: "Orange"
                mediaId: 2
            }
            ListElement {
                medianame: "Banana"
                mediaId: 3
            }
            ListElement {
                medianame: "Apple"
                mediaId: 1
            }
            ListElement {
                medianame: "Orange"
                mediaId: 2
            }
            ListElement {
                medianame: "Banana"
                mediaId: 3
            }
        }
        GridView {
            id: mediaList
            x: 55
            y: 54
            anchors.top: parent.top;
            anchors.right: parent.right;
            anchors.topMargin: 40;
            anchors.rightMargin: 50;
            width: 700
            height: 400
            cacheBuffer: 320

            cellWidth: 400
            cellHeight: 55

            flow: GridView.TopToBottom
            snapMode: GridView.SnapToRow

            clip: true

            model: meidaListModel;
            delegate: Item {
                Rectangle {
                    width: 400;
                    height: 55;
                    color: "transparent"
                    anchors.top: parent.top;
                    anchors.topMargin: 10;
                    MouseArea {
                        anchors.fill: parent;
                        onClicked: {
                            udiskPopup.visible = true;
                        }
                    }

                    PushButton {
                        id: bianhao
                        width: 40
                        height: 40
                        anchors.top: parent.top;
                        anchors.topMargin: 5
                        icon: "images/udiskAddbianhao.png"
                        text: mediaId
                        colorText: "white"
                    }
                    Text {
                        id: mediaFilename
                        width: 40
                        height: 40
                        anchors.left: bianhao.right
                        anchors.leftMargin: 20;
                        anchors.top: parent.top;
                        anchors.topMargin: 12;
                        anchors.verticalCenter: parent.verticalCenter;
                        text: medianame
                        color: "white"
                        font.pixelSize: 18
                    }

                }
            }
        }//end GridView

        PushButton {
            id: leftButton
            x: 534
            y: 480
            width: 68
            height: 36
            anchors.top: parent.top;
            anchors.topMargin: 480
            backgroundNormal: "images/left.png"
        }
        Text {
            id: pageNO
            x: 634
            y: 480
            width: 80
            height: 36
            anchors.verticalCenter: leftButton.verticalCenter;
            text: "10/100"
            color: "white"
            font.pixelSize: 20
        }
        PushButton {
            id: rightButton
            x: 742
            y: 480
            width: 68
            height: 36
            anchors.top: parent.top;
            anchors.topMargin: 480
            backgroundNormal: "images/right.png"
        }
        PushButton {
            id: closeButton
            x: 1055
            y: -8
            width: 40
            height: 40
            anchors.top: parent.top;
            anchors.topMargin: -8
            backgroundNormal: "images/del.png"
            onClicked: {
                udiskAddPage.udiskCloseClicked();
            }
        }

        Rectangle {
            id: udiskPopup
            x: 594
            y: 102
            width: 160;
            height: 140;
            color: "transparent"
            visible: false;
            Image {
                id: udiskPopupBg
                anchors.fill: parent;
                source: "images/udiskAddpopup.png";
            }
            PushButton {
                id: udiskAddButton;
                width: 140;
                height: 60;
                anchors.top: parent.top;
                anchors.left: parent.left;
                anchors.topMargin: 6;
                anchors.leftMargin: 10;
                text: "播放";
                colorText: "white";
                onClicked: {
                    udiskPopup.visible = false;
                }
            }
            PushButton {
                id: udiskPlayButton;
                width: 140;
                height: 60;
                anchors.top: udiskAddButton.bottom;
                anchors.left: parent.left;
                anchors.topMargin: 2;
                anchors.leftMargin: 10;
                text: "加歌";
                colorText: "white";
                onClicked: {
                    udiskPopup.visible = false;
                }
            }
        }
    }

    //U盘加歌编辑界面
    Rectangle {
        id:udiskAddEdit
        anchors.fill: parent;
        color: "transparent"
        Image {
            id: udiskAddEditBg
            anchors.fill: parent;
            source: "images/udiskAddEditbg.png"
        }
        Text {
            id: wait2AddFileName
            x: 48
            y: 33
            width: 291
            height: 29
            color: "#ffffff"
            property string fileName: "abc.mv"
            text: qsTr("待添加歌曲文件: ")+fileName;
            verticalAlignment: Text.AlignBottom
            font.pixelSize: 20
        }

        Text {
            id: gen2AddFileName
            x: 415
            y: 33
            width: 350
            height: 29
            color: "#ffffff"
            property string fileName: "123.mv"
            text: qsTr("待添加歌曲文件 : ")+fileName;
            font.pixelSize: 20
            verticalAlignment: Text.AlignBottom
        }

        Text {
            id: text1
            x: 48
            y: 80
            width: 97
            height: 27
            color: "#ffffff"
            text: qsTr("歌曲名称 : ")
            verticalAlignment: Text.AlignBottom
            font.pixelSize: 20
        }

        Text {
            id: text2
            x: 48
            y: 125
            width: 97
            height: 27
            color: "#ffffff"
            text: qsTr("歌曲名一 : ")
            font.pixelSize: 20
            verticalAlignment: Text.AlignBottom
        }

        Text {
            id: text3
            x: 48
            y: 168
            width: 97
            height: 27
            color: "#ffffff"
            text: qsTr("发行版本 : ")
            font.pixelSize: 20
            verticalAlignment: Text.AlignBottom
        }

        Text {
            id: text4
            x: 48
            y: 213
            width: 97
            height: 27
            color: "#ffffff"
            text: qsTr("歌曲节拍 : ")
            font.pixelSize: 20
            verticalAlignment: Text.AlignBottom
        }

        Text {
            id: text5
            x: 48
            y: 256
            width: 97
            height: 27
            color: "#ffffff"
            text: qsTr("演唱心情 : ")
            font.pixelSize: 20
            verticalAlignment: Text.AlignBottom
        }

        Text {
            id: text6
            x: 48
            y: 301
            width: 97
            height: 27
            color: "#ffffff"
            text: qsTr("默认音量 : ")
            font.pixelSize: 20
            verticalAlignment: Text.AlignBottom
        }

        Text {
            id: category_tag
            x: 48
            y: 349
            width: 97
            height: 27
            color: "#ffffff"
            text: qsTr("分类标签 : ")
            font.pixelSize: 20
            verticalAlignment: Text.AlignBottom
        }

        Text {
            id: text8
            x: 415
            y: 125
            width: 97
            height: 27
            color: "#ffffff"
            text: qsTr("歌曲名二 : ")
            font.pixelSize: 20
            verticalAlignment: Text.AlignBottom
        }

        Text {
            id: text9
            x: 415
            y: 168
            width: 97
            height: 27
            color: "#ffffff"
            text: qsTr("歌曲语种 : ")
            font.pixelSize: 20
            verticalAlignment: Text.AlignBottom
        }

        Text {
            id: text10
            x: 415
            y: 213
            width: 97
            height: 27
            color: "#ffffff"
            text: qsTr("演唱类别 : ")
            font.pixelSize: 20
            verticalAlignment: Text.AlignBottom
        }

        Text {
            id: text11
            x: 415
            y: 256
            width: 97
            height: 27
            color: "#ffffff"
            text: qsTr("伴奏位置 : ")
            font.pixelSize: 20
            verticalAlignment: Text.AlignBottom
        }

        Text {
            id: text12
            x: 415
            y: 301
            width: 97
            height: 27
            color: "#ffffff"
            text: qsTr("附加显示 : ")
            font.pixelSize: 20
            verticalAlignment: Text.AlignBottom
        }
        Column {
            spacing: 5
            anchors.left: parent.left;
            anchors.leftMargin: 52
            anchors.top: category_tag.bottom;
            anchors.topMargin: 10;
            Repeater {
                model: 2;
                Row {
                    spacing: 18;
                    Repeater {
                        model: ["流行","流行","流行","流行","流行","流行"];
                        delegate:
                        PushButton {
                            y: 0
                            width: 98;
                            height: 44;
                            backgroundNormal: "images/udiskAddButton.png";
                            text: modelData;
                            colorText: "white";
                        }
                    }
                }
            }
        }

        Rectangle {
            anchors.left: udiskAddEdit.left;
            anchors.leftMargin: 400;
            anchors.bottom: udiskAddEdit.bottom;
            anchors.bottomMargin: 90;
        }
        Column {
            x: 400
            y: 496
            Row {
                spacing: 18;
                Repeater {
                    model: ["开始加歌","清除信息","返回列表"];
                    delegate:
                        PushButton {
                        y: 0
                        width: 98;
                        height: 44;
                        backgroundNormal: "images/udiskAddButton.png";
                        text: modelData;
                        colorText: "white";
                    }
                }
            }
        }

        TextInput {
            id: mediaName;
            width: 210; height: 35;
            x: 156
            y: 79
            anchors.rightMargin: -156
            anchors.leftMargin: 156
            anchors.topMargin: 79
            Image {
                anchors.fill: parent;
                source: "images/udiskAddEditInputBg.png"
            }
            text: "吻别"
            font.pixelSize: 22
            color: "white"
        }

        TextInput {
            id: mediaName1
            x: 156
            y: 121
            width: 210
            height: 35
            Image {
                anchors.fill: parent
                source: "images/udiskAddEditInputBg.png"
            }
            font.pixelSize: 22
            color: "white"

        }

        TextInput {
            id: mediaName2
            x: 523
            y: 121
            width: 210
            height: 35
            Image {
                anchors.fill: parent
                source: "images/udiskAddEditInputBg.png"
            }
            font.pixelSize: 22
            color: "white"
        }

        Column {
            x: 156
            y: 168
            width: 577; height: 160;
            spacing: 5;
            Repeater {
                model: 4;
                Row {
                    spacing: 158;
                    Repeater {
                        model: 2
                        Rectangle {
                            width: 208; height: 38;
                            color: "transparent"
                            PushButton {
                                anchors.left: parent.left;
                                backgroundNormal: "images/udiskAddEditInput-.png";
                                width: 50; height: 38;
                            }
                            TextInput {
                                width: 105
                                height: 34
                                anchors.left: parent.left;
                                anchors.leftMargin: 50;
                                anchors.top: parent.top;
                                anchors.topMargin: 2;
                                Image {
                                    anchors.fill: parent
                                    source: "images/udiskAddEditInputBg.png"
                                }
                                font.pixelSize: 22;
                                color: "white"
                            }
                            PushButton {
                                anchors.right: parent.right;
                                backgroundNormal: "images/udiskAddEditInput+.png";
                                width: 50; height: 38;

                            }
                        }
                    }
                }
            }
        }

//        Rectangle {
//            x: 157
//            y: 163
//            width: 208; height: 38;
//            PushButton {
//                anchors.left: parent.left;
//                backgroundNormal: "images/udiskAddEditInput-.png";
//                width: 50; height: 38;
//                visible: false;
//            }
//            TextInput {
//                width: 105
//                height: 34
//                anchors.left: parent.left;
//                anchors.leftMargin: 50;
//                anchors.top: parent.top;
//                anchors.topMargin: 2;
//                Image {
//                    anchors.fill: parent
//                    source: "images/udiskAddEditInputBg.png"
//                }
//                font.pixelSize: 22
//                color: "white"
//                visible: false;
//            }
//            PushButton {
//                anchors.right: parent.right;
//                backgroundNormal: "images/udiskAddEditInput+.png";
//                width: 50; height: 38;
//                visible: false;
//            }
//        }
//
//        Rectangle {
//            x: 156
//            y: 208
//            width: 208
//            height: 38
//        }

//        Rectangle {
//            x: 156
//            y: 251
//            width: 208
//            height: 38
//        }

//        Rectangle {
//            x: 156
//            y: 296
//            width: 208
//            height: 38
//        }

//        Rectangle {
//            x: 523
//            y: 163
//            width: 208
//            height: 38
//        }

//        Rectangle {
//            x: 523
//            y: 208
//            width: 208
//            height: 38
//        }

//        Rectangle {
//            x: 523
//            y: 251
//            width: 208
//            height: 38
//        }

//        Rectangle {
//            x: 523
//            y: 296
//            width: 208
//            height: 38
//        }

        //右边上面的输入框
        Rectangle {
            id: righttopinput;
            width: 303;
            height: 38;
            anchors.right: parent.right;
            anchors.top: parent.top;
            anchors.rightMargin: 40;
            anchors.topMargin: 74;
            color: "transparent";
            Image {
                id: righttopinputbg
                anchors.fill: parent;
                source: "images/udiskAddEditRightTopBg.png";
            }
            TextInput {
                id:righttopinputfield;
                width: 263;
                height: 38;
                anchors.left: parent.left;
                anchors.leftMargin: 40;
                anchors.top: parent.top;
                anchors.topMargin: 5;
                text: "吻别";
                font.pixelSize: 22;
                color: "black";
            }
        }

        //右边中下输入框和输入面板

        Rectangle {
            id: rightInputPanel;
            width: 303;
            height: 421;
            anchors.right: parent.right;
            anchors.bottom: parent.bottom;
            anchors.rightMargin: 40;
            anchors.bottomMargin: 50;
            color: "transparent"
            Image {
                id: rightInputPanelBg
                source: "images/udiskAddEditInputPanelBg.png"
            }
            //输入方法按钮横条
            Rectangle {
                id: inputMethodBanner
                width: 296;
                height: 52;
                anchors.top: parent.top;
                anchors.left: parent.left;
                anchors.leftMargin: 3;
                anchors.topMargin: 3;
                color: "transparent";
                PushButton {
                    id: shouzimu
                    property bool highlighted: true;
                    width: 296/3;
                    height: 52;
                    anchors.left: parent.left;
                    anchors.top: parent.top;
                    text: "首字母"
                    colorText: "white"
                    icon: shouzimu.highlighted?"images/udiskAddEditSelected.png":"";
                    onClicked:{
                        shouzimu.highlighted = true;
                        shouxie.highlighted = false;
                    }
                }
                PushButton {
                    id: shouxie
                    property bool highlighted: false;
                    width: 296/3;
                    height: 52;
                    anchors.left: shouzimu.right;
                    anchors.top: parent.top;
                    text: "手 写"
                    colorText: "white"
                    icon: shouxie.highlighted?"images/udiskAddEditSelected.png":"";
                    onClicked:{
                        shouxie.highlighted = true;
                        shouzimu.highlighted = false;
                    }
                }
                PushButton {
                    id: backspace
                    width: 32;
                    height: 32;
                    anchors.left: shouxie.right;
                    anchors.leftMargin: 10;
                    anchors.top: parent.top;
                    anchors.topMargin: 10;
                    backgroundNormal: "images/udiskAddEditBackspace.png"
                }
                PushButton {
                    id: deleteButton
                    width: 32;
                    height: 32;
                    anchors.left: backspace.right;
                    anchors.leftMargin: 15;
                    anchors.top: parent.top;
                    anchors.topMargin: 10;
                    backgroundNormal: "images/udiskAddEditDelete.png"
                }
            }
            //候选字栏
            Rectangle {
                id: candidateRow;
                width: 296;
                height: 50;
                anchors.left: parent.left;
                anchors.leftMargin: 4;
                anchors.top: inputMethodBanner.bottom;
                color: "transparent";
                PushButton {
                    id: udiskAddEditleft
                    width: 22; height: 22;
                    backgroundNormal: "images/udiskAddEditLeft.png";
                    anchors.left: parent.left;
                    anchors.leftMargin: 15;
                    anchors.top: parent.top;
                    anchors.topMargin: 15;
                }
                PushButton {
                    id: udiskAddEditright
                    width: 22; height: 22;
                    backgroundNormal: "images/udiskAddEditRight.png";
                    anchors.right: parent.right;
                    anchors.rightMargin: 15;
                    anchors.top: parent.top;
                    anchors.topMargin: 15;
                }
            }
            //键盘区和手写区
            Rectangle {
                id: inputArea;
                width: 295;
                height: 312;
                anchors.top: candidateRow.bottom;
                anchors.left: parent.left;
                color: "transparent";
                //虚拟键盘
                Rectangle {
                    id: keyboardArea;
                    anchors.fill: parent;
                    color: "transparent";
                    Column {
                        anchors.fill: parent;
                        anchors.topMargin: 6;
                        anchors.leftMargin: 7;
                        width: 295;
                        height: 312;
                        spacing: 5;
                        Repeater {
                            model: [['a','b','c','d','e'],['e','f','h','i','j'],['k','l','m','n','o'],['p','q','r','s','t'],['u','v','w','x','y']];
                            Row {
                                spacing: 3;
                                Repeater {
                                    model: modelData;
                                    PushButton {
                                        width: 56;
                                        height: 48;
                                        backgroundNormal: "images/udiskAddEditkey1.png"
                                        text: modelData.toUpperCase();
                                    }

                                }
                            }
                        }
                    }
                }
                //手写键盘
                Rectangle {
                    id: handWritingArea;
                    anchors.fill: parent;
                    visible: false;
                }
            }
        }






    }//end ---U盘加歌编辑界面


}
