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
        width: 1280
        height: 500
        anchors.top: navDiangeImage.bottom
//        color: "red"

        FlipButton {
            id: firstGrid

            x: 119
            y: 48
            width: 80
            height: 123

            text: "第一个"

            image: "images/dy-star.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: secondGrid

            x: 119
            y: 177
            width: 80
            height: 123

            text: "第二个"

            image: "images/dy-star.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: rihanGrid

            x: 119
            y: 306
            width: 80
            height: 123

            text: "日韩"

            image: "images/dy-star.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: quanbuGrid

            x: 205
            y: 48
            width: 338
            height: 252

            text: "全部"

            image: "images/dy-star.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: liuxingGrid

            x: 205
            y: 306
            width: 166
            height: 123

            text: "流行"

            image: "images/dy-star.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: meinvGrid

            x: 377
            y: 306
            width: 166
            height: 123

            text: "美女"

            image: "images/dy-star.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: minnanGrid

            x: 549
            y: 48
            width: 166
            height: 123

            text: "闽南"

            image: "images/dy-star.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: xingeGrid

            x: 549
            y: 177
            width: 168
            height: 252

            text: "新歌"

            image: "images/dy-star.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: meinv2Grid

            x: 721
            y: 48
            width: 115
            height: 123

            text: "美女2"

            image: "images/dy-star.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: duichangGrid

            x: 842
            y: 48
            width: 115
            height: 123

            text: "对唱"

            image: "images/dy-star.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: oumeiGrid

            x: 963
            y: 48
            width: 80
            height: 123

            text: "欧美"

            image: "images/dy-star.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: lanseGrid

            x: 723
            y: 177
            width: 94
            height: 123

            text: "蓝色"

            image: "images/dy-star.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: guoyuGrid

            x: 823
            y: 177
            width: 220
            height: 123

            text: "国语"

            image: "images/dy-star.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: wangluoGrid

            x: 723
            y: 306
            width: 113
            height: 123

            text: "网络"

            image: "images/dy-star.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: shuaigeGrid

            x: 842
            y: 306
            width: 115
            height: 123

            text: "帅哥"

            image: "images/dy-star.png"

            onClicked: {
                handlerLoader("FinalMusicSelectionPage.qml", 0)
            }
        }

        FlipButton {
            id: yueyuGrid

            x: 963
            y: 306
            width: 80
            height: 123

            text: "粤语"

            image: "images/dy-star.png"

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
