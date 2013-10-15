/*
 *根据歌星选择歌曲
**/

import QtQuick 2.0
import "componentCreation.js" as ComponentCreation

Rectangle {
    width: 1280
    height: 591
    color: "red"

    property var langArray: new Array("全部", "国语", "粤语", "闽南语", "外语", "网络", "独家")

    signal handlerLoader(string name, int index)

    Item {
        id: tabbarId

        anchors.left: parent.left
        anchors.top: parent.top
        width: parent.width

        //导航图标
        Image {
            id: navDiangeImage
            anchors.left: parent.left
            anchors.top: parent.top
            source: "images/diange.fw.png"
        }

        //导航标题
        Text {
            id: navTitleLabel
            anchors.left: navDiangeImage.right
            anchors.leftMargin: 4
            anchors.verticalCenter: navDiangeImage.verticalCenter
            text: qsTr("点歌")
            font.pixelSize: 24
            color: "#FFFFFFFF"
        }

        //Tab标签栏
        Image {
            id: tabBar
            anchors.left: parent.left
            anchors.top: navDiangeImage.bottom
            source: "images/daohangtiao.png"
        }

        //创建语言选择按钮
        Component.onCompleted: {
            var preButton = null;
            for(var i=0; i<langArray.length; i++) {
                var button = ComponentCreation.createTabButton(tabBar, langArray[i]);
                if (preButton == null) {
                    button.anchors.left = tabbarId.left;
                    button.anchors.leftMargin = 20;
                } else {
                    button.anchors.left = preButton.right;
                    button.anchors.leftMargin = 10;
                }
                preButton = button;
            }
        }
    }

    TestListModel {
        id: testModel
    }

    GridView {
        id: musicList
        x: 106
        y: 79

        width: 1095
        height: 444

        cellWidth: 182
        cellHeight: 207

        flow: GridView.TopToBottom
        snapMode: GridView.SnapToRow

        clip: true

        model: testModel
        delegate: Item {
            width: 182
            height: 207

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    musicList.currentIndex = index
                }
            }

            Image {
                width: 182
                height: 207

                source: "images/starBg.png"
            }
        }
    }

    PushButton {
        id: leftButton
        x: 693
        y: 495
        width: 68
        height: 36

        anchors.top: musicList.bottom
        anchors.topMargin: -28

        icon: "images/left.png"
    }

    Text {
        id: pageLabel
        x: 775
        y: 502
        width: 128
        height: 22

        anchors.top: musicList.bottom
        anchors.topMargin: -21

        text: "10/100"
        horizontalAlignment: Text.AlignHCenter
        color: "#FFFFFFFF"
        font.pixelSize: 18
    }

    PushButton {
        id: rightButton
        x: 921
        y: 495
        width: 68
        height: 36

        anchors.top: musicList.bottom
        anchors.topMargin: -28

        icon: "images/right.png"
    }

    PushButton {
        x: 1101
        y: 494

        width: 100
        height: 44

        icon: "images/back.png"

        onClicked: {
            handlerLoader("TopicSelectionPage.qml", 0)
        }
    }
}
