/*
 *根据排名点歌
**/

import QtQuick 2.0

Rectangle {
    width: 1280
    height: 591
    color: "cyan"

    signal handlerLoader(string name, int index)

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

    Item {
        x: 54
        y: 46
        width: 1280
        height: 504
        anchors.topMargin: 4
        anchors.top: navDiangeImage.bottom
//        color: "red"

        FlipButton {
            id: firstGrid

            x: 0
            y: 23
            width: 112
            height: 138

//            text: "第一个"

            image: "images/top/1.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: secondGrid

            x: 0
            y: 167
            width: 112
            height: 138

//            text: "第二个"

            image: "images/top/2.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: rihanGrid

            x: 0
            y: 316
            width: 112
            height: 138

//            text: "日韩"

            image: "images/top/3.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: quanbuGrid

            x: 118
            y: 23
            width: 436
            height: 286

//            text: "全部"

            image: "images/top/4.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: liuxingGrid

            x: 118
            y: 316
            width: 221
            height: 138

//            text: "流行"

            image: "images/top/5.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: meinvGrid

            x: 345
            y: 316
            width: 212
            height: 138

//            text: "美女"

            image: "images/top/6.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: minnanGrid

            x: 563
            y: 29
            width: 212
            height: 136

//            text: "闽南"

            image: "images/top/7.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: xingeGrid

            x: 563
            y: 173
            width: 212
            height: 281

//            text: "新歌"

            image: "images/top/8.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: meinv2Grid

            x: 786
            y: 29
            width: 138
            height: 138

//            text: "美女2"

            image: "images/top/9.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: duichangGrid

            x: 934
            y: 29
            width: 138
            height: 138

//            text: "对唱"

            image: "images/top/12.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: oumeiGrid

            x: 1083
            y: 29
            width: 112
            height: 138

//            text: "欧美"

            image: "images/top/13.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: lanseGrid

            x: 786
            y: 173
            width: 112
            height: 138

//            text: "蓝色"

            image: "images/top/10.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: guoyuGrid

            x: 909
            y: 173
            width: 286
            height: 138

//            text: "国语"

            image: "images/top/14.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: wangluoGrid

            x: 786
            y: 318
            width: 138
            height: 136

//            text: "网络"

            image: "images/top/11.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: shuaigeGrid

            x: 934
            y: 318
            width: 138
            height: 136

//            text: "帅哥"

            image: "images/top/15.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: yueyuGrid

            x: 1083
            y: 318
            width: 112
            height: 138

//            text: "粤语"

            image: "images/top/16.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        transform: Rotation {
            id: rotation
            origin.x: 0
            origin.y: 0
            axis.x: 0
            axis.y: 1
            axis.z: 0
            angle: 0
        }

        ParallelAnimation {
            id: animation

            ParentAnimation {
                RotationAnimation {
                    target: rotation
                    properties: "angle"
                    to:0
                    from: 90
                    direction: RotationAnimation.Clockwise
                }
            }

            NumberAnimation {
                targets: [yueyuGrid];
                properties: "y";
                from: 100
                to: 306
                duration: 200
            }
        }

        Component.onCompleted: {
            animation.start()
        }
    }
}
