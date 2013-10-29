/*
 *最终的歌曲选择界面
**/

import QtQuick 2.0
import QtQuick.Controls 1.0

Rectangle {
    id: finalPage

    width: 1280
    height: 591
    color: "transparent"

    signal handleLoader(string name, int index)

//    //导航图标
//    Image {
//        id: navDiangeImage
//        anchors.left: parent.left
//        anchors.top: parent.top
//        source: "images/diange.fw.png"
//    }

//    //导航标题
//    Text {
//        id: navTitleLabel
//        anchors.left: navDiangeImage.right
//        anchors.leftMargin: 4
//        anchors.verticalCenter: navDiangeImage.verticalCenter
//        text: qsTr("点歌")
//        font.pixelSize: 24
//        color: "#FFFFFFFF"
//    }

    Row {
        Item {
            id: leftHalf
            width: 400
            height: 400

            Image {
                id: waike
                x: 81
                y: 62
                width: 331
                height: 226
                anchors.left: parent.left
                anchors.leftMargin: 81
                anchors.top: parent.top
                anchors.topMargin: 62

                source: "images/TopicCategorySubPage/1.png"
            }

            Image {
                property real translateY: -140
                x: 94
                y: 208

                id: guangpan
                width: 305
                height: 307
                anchors.leftMargin: 13
                anchors.left: waike.left
                anchors.top: waike.bottom
                anchors.topMargin: -80

                transform: Translate {
                    y: guangpan.translateY
                }

                z: waike.z - 1

                source: "images/TopicCategorySubPage/2.png"
            }

            SequentialAnimation {
                id: animation

                NumberAnimation {
                    target: guangpan;
                    property: "translateY";
                    to: -80
                    duration: 1000;
                    easing.type: Easing.InOutQuad
                }

                SequentialAnimation {
                    loops: Animation.Infinite

                    RotationAnimation {
                        target: guangpan;
                        from: 0
                        to: -180
                        duration: 16000;
//                        easing.type: Easing.InOutQuad
                    }

                    RotationAnimation {
                        target: guangpan;
                        from: -180
                        to: -360
                        duration: 16000;
//                        easing.type: Easing.InOutQuad
                    }
                }
            }

            Component.onCompleted: {
                animation.start()
            }
        }

        Item {
            anchors.left: leftHalf.right
            anchors.top: leftHalf.top
            anchors.topMargin: 60

            Image {
                width: 791
                height: 458

                source: "images/TopicCategorySubPage/3.png"
            }

            TestListModel {
                id: testModel
            }

            GridView {
                id: musicList
                x: 0
                y: 0

                width: 791
                height: 400

                cellWidth: 791
                cellHeight: 57

                flow: GridView.TopToBottom
                snapMode: GridView.SnapToRow

                clip: true
                cacheBuffer: 40;
                model: testModel
                delegate: Item {
                    width: 791
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

                        backgroundNormal: "images/TopicCategorySubPage/5.png"
                    }

                    PushButton {
                        id: shoucang
                        width: 31
                        height: 31

                        anchors.left: parent.right
                        anchors.leftMargin: -128
                        anchors.top: parent.top
                        anchors.topMargin: 16

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
        }
    }

    PushButton {
        id: leftButton
        x: 336
        y: 427
        width: 68
        height: 36

        anchors.top: backButton.top;
        anchors.topMargin: 0
        anchors.right: pageLabel.left
        anchors.rightMargin: 15;

        backgroundNormal: "images/left.png"
    }

    Text {
        id: pageLabel
        x: 420
        y: 434
        width: 120
        height: 22

        anchors.top: rightButton.top
        anchors.topMargin: 5
        anchors.right: rightButton.left
        anchors.rightMargin: 15;

        text: "10/100"
        horizontalAlignment: Text.AlignHCenter
        color: "#FFFFFFFF"
        font.pixelSize: 18
    }

    PushButton {
        id: rightButton
        x: 563
        y: 427
        width: 68
        height: 36

        anchors.top: backButton.top
        anchors.topMargin: 0
        anchors.right: backButton.left;
        anchors.rightMargin: 80


        backgroundNormal: "images/right.png"
    }

    PushButton {
        id: backButton
        x: 1110;/*1090*/
        y: 500

        width: 100
        height: 44
        anchors.right: parent.right;
        anchors.rightMargin: 80;
        backgroundNormal: "images/back.png"

        onClicked: {
            finalPage.handleLoader("TopicSelectionPage.qml", 0)
        }
    }
}
