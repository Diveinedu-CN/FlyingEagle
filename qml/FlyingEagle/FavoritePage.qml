/*
 *收藏页面
**/

import QtQuick 2.0

Rectangle {
    width: 1280
    height: 591
    color: "transparent"

    signal handlerLoader(string name, int index)

    Item {
        id: contentItem

        x: 55
        y: -8
        anchors.left: parent.left
        anchors.leftMargin: 55

        width: 1158
        height: 516
        visible: false

        Image {
            x: 25
            y: 79
            source: "images/userBg.png"
            width: 267
            height: 399
        }

        Image {
            x: 82
            y: 103
            source: "images/head.png"
        }

        Text {
            x: 96
            y: 268
            color: "#ffffff"
            text: "12345678901"
            styleColor: "#ffffff"
            font.pointSize: 18
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }

        Text {
            x: 117
            y: 337
            color: "#ffffff"
            text: "上次登陆时间:"
        }

        Text {
            x: 100
            y: 366
            color: "#ffffff"
            text: "2013.10.10 22:30"
        }

        Image {
            x: 350
            y: 79
            width: 791
            height: 458
            source: "images/TopicCategorySubPage/3.png"
        }

        TestListModel {
            id: testModel
        }

        GridView {
            id: musicList
            x: 350
            y: 79

            width: 791
            height: 400

            cellWidth: 791
            cellHeight: 56

            flow: GridView.TopToBottom
            snapMode: GridView.SnapToRow

            clip: true
            cacheBuffer: 40;
            model: testModel
            delegate: Item {
                width: 791
                height: 55

//                    Rectangle {
//                        width: 791
//                        height: 54

//                        color: index % 2?"#FF0000":"#00FF00"
//                    }

                Text {
                    id: numberId
                    anchors.left: parent.left
//                        anchors.leftMargin: 40
                    anchors.top: parent.top
                    anchors.topMargin: 25
                    width: 60

                    text: index+1
                    verticalAlignment: Text.AlignBottom
                    horizontalAlignment: Text.AlignHCenter
                    color: "#FFFFFFFF"
                    font.pixelSize: 18
                }

                Text {
                    id: titleId

                    anchors.left: numberId.right
                    anchors.leftMargin: 20
                    anchors.top: parent.top
                    anchors.topMargin: 25

                    text: name
                    color: "#FFFFFFFF"
                    font.pixelSize: 18
                }

                Text {
                    id: starId

                    anchors.left: parent.right
                    anchors.leftMargin: -362
                    anchors.top: parent.top
                    anchors.topMargin: 25

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
                    anchors.topMargin: 20

                    backgroundNormal: "images/TopicCategorySubPage/5.png"
                }

                PushButton {
                    id: shoucang
                    width: 31
                    height: 31

                    anchors.left: parent.right
                    anchors.leftMargin: -128
                    anchors.top: parent.top
                    anchors.topMargin: 20

                    backgroundNormal: "images/TopicCategorySubPage/6.png"
                }

                PushButton {
                    id: yulan
                    width: 34
                    height: 22

                    anchors.left: parent.right
                    anchors.leftMargin: -66
                    anchors.top: parent.top
                    anchors.topMargin: 20

                    backgroundNormal: "images/TopicCategorySubPage/7.png"
                }
            }
        }

        PushButton {
            x: 99
            y: 407
            width: 120
            height: 44
            text: "退出"
            colorText: "#ffffff"
            backgroundNormal: "images/btnQuit.png"
            onClicked: {
                keyboardLoader.source = "telKeyBoard.qml"
                contentItem.visible = false;
            }
        }


    }

    Item {
        x: 549
        y: 58
        width: 302
        height: 437

        Loader {
            x: 0
            y: -14

            id: keyboardLoader
            source: "telKeyBoard.qml"
        }
    }

    Connections {
        target: keyboardLoader.item
        ignoreUnknownSignals: true
        onConfirmClicked: {
            keyboardLoader.source = ""
            contentItem.visible = true
        }
    }
    PushButton {
        id: leftButton
        x: 733/*693*/
        y: 461
        width: 68
        height: 36
        visible: contentItem.visible

        anchors.bottom: parent.bottom
        anchors.bottomMargin: 35;

        backgroundNormal: "images/left.png"
    }

    Text {
        id: pageLabel
        x: 805/*775*/
        y: 468
        width: 128
        height: 22
        visible: contentItem.visible

        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40;

        text: "10/100"
        horizontalAlignment: Text.AlignHCenter
        color: "#FFFFFFFF"
        font.pixelSize: 18
    }

    PushButton {
        id: rightButton
        x: 950/*921*/
        y: 461
        width: 68
        height: 36
        visible: contentItem.visible

        anchors.bottom: parent.bottom
        anchors.bottomMargin: 35;

        backgroundNormal: "images/right.png"
    }

    PushButton {
        x: 1110
        y: 482
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 27;
        width: 100
        height: 44

        backgroundNormal: "images/back.png"

        onClicked: {
            handlerLoader("HomePage.qml", 0)
        }
    }
}
