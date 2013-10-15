/*
 *根据歌星选择歌曲
**/

import QtQuick 2.0
import "componentCreation.js" as ComponentCreation

Rectangle {
    width: 1280
    height: 591
    color: "transparent"

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

        NavigationBar {
            id: navBar
            anchors.left: navDiangeImage.right

            Component.onCompleted: {
                navBar.createButtons(langArray)
            }
        }

        Connections {
            target: navBar
            ignoreUnknownSignals: true
            onClicked: {
                console.log(item.tag)
            }
        }

        //Tab标签栏
        Image {
            id: tabBar
            anchors.left: parent.left
            anchors.top: navDiangeImage.bottom
            source: "images/daohangtiao.png"
        }

        MenuTabBar {
            id: menuTabBar
            anchors.left: tabBar.left
            anchors.top: tabBar.top

            Component.onCompleted: {
                menuTabBar.createButtons(langArray)
            }
        }

        Connections {
            target: menuTabBar
            ignoreUnknownSignals: true
            onClicked: {
//                musicList.model.destroy();

                if(item.tag === 0) {
                    musicList.model = Qt.createComponent("TestListModel.qml")
                    console.log(musicList.model)
                } else {
                    musicList.model = Qt.createComponent("TestListModel.qml")
                }
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

            Text {
                id: starName
                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.top: parent.top
                anchors.topMargin: 10

                text: star
                color: "#FFFFFFFF"
                font.pixelSize: 30
                font.bold: true
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
