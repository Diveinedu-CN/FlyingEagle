import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

Rectangle {
    width: 1280
    height: 591
    color: "purple"

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

    Row {
        Item {
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 60

            Image {
                x: 55
                y: 10
                width: 1158
                height: 489

                source: "images/finalTop/topbackground.png"
            }

            Image {
                x: 1075
                y: 39
                width: 146
                height: 136
                source: "images/finalTop/5.png"
            }

            PushButton {
                x: 1075
                y: 39
                width: 146
                height: 136

                text: "总排行"
                colorText: "#FFFFFFFF"
            }

            PushButton {
                x: 1075
                y: 173
                width: 146
                height: 136

                text: "月排行"
                colorText: "#FFFFFFFF"
            }

            PushButton {
                x: 1075
                y: 308
                width: 146
                height: 136

                text: "周排行"
                colorText: "#FFFFFFFF"
            }

            TestListModel {
                id: testModel
            }

            GridView {
                id: musicList
                x: 55
                y: 54

                width: 1018
                height: 416
                cacheBuffer: 320

                cellWidth: 505
                cellHeight: 65

                flow: GridView.TopToBottom
                snapMode: GridView.SnapToRow

                clip: true

                model: testModel
                delegate: Item {
                    width: 579
                    height: 57

//                    Rectangle {
//                        width: 791
//                        height: 57

//                        color: index % 2?"#FF0000":"#00FF00"
//                    }

                    Text {
                        id: numberId
                        anchors.left: parent.left
//                        anchors.leftMargin: 40
                        anchors.top: parent.top
                        anchors.topMargin: 20
                        width: 60

                        text: index+1
                        horizontalAlignment: Text.AlignHCenter
                        color: "#FFFFFFFF"
                        font.pixelSize: 18
                    }

                    Text {
                        id: titleId

                        anchors.left: numberId.right
                        anchors.leftMargin: 20
                        anchors.top: parent.top
                        anchors.topMargin: 20

                        text: name
                        color: "#FFFFFFFF"
                        font.pixelSize: 18
                    }

                    Text {
                        id: starId

                        anchors.left: parent.right
                        anchors.leftMargin: -362
                        anchors.top: parent.top
                        anchors.topMargin: 20

                        text: star
                        //55, 99, 152
                        color: "#FF376398"
                        font.pixelSize: 18
                    }

                    PushButton {
                        id: zhiding
                        width: 31
                        height: 31

                        anchors.left: parent.right
                        anchors.leftMargin: -192
                        anchors.top: parent.top
                        anchors.topMargin: 16

                        icon: "images/主题分类子页面/5.png"
                    }

                    PushButton {
                        id: shoucang
                        width: 31
                        height: 31

                        anchors.left: parent.right
                        anchors.leftMargin: -128
                        anchors.top: parent.top
                        anchors.topMargin: 16

                        icon: "images/主题分类子页面/6.png"
                    }

                    PushButton {
                        id: yulan
                        width: 34
                        height: 22

                        anchors.left: parent.right
                        anchors.leftMargin: -66
                        anchors.top: parent.top
                        anchors.topMargin: 20

                        icon: "images/主题分类子页面/7.png"
                    }
                }
            }
        }
    }
}
