import QtQuick 2.0

Item {
    x: 54
    y: 46
    width: 1280
    height: 504

    id: rankContent

//    anchors.topMargin: 4
//    anchors.top: navDiangeImage.bottom
//        color: "red"

    signal clicked(string name, int index)

    FlipButton {
        id: firstGrid

        x: 0
        y: 23
        width: 112
        height: 138

//            text: "第一个"

        image: "images/top/1.png"

        onClicked: {
//            handlerLoader("FinalRankMusicSelectionPage.qml", 0)
//            parent.clicked("无", 0)
        }
    }

    FlipButton {
        id: secondGrid

        x: 0
//        y: 167
        y: 1000
        width: 112
        height: 138

//            text: "第二个"

        image: "images/top/2.png"

        onClicked: {
            parent.clicked("无", 1)
        }
    }

    FlipButton {
        id: rihanGrid

        x: 0
//        y: 316
        y: 1000
        width: 112
        height: 138

//            text: "日韩"

        image: "images/top/3.png"

        onClicked: {
            parent.clicked("日韩", 2)
        }
    }

    FlipButton {
        id: quanbuGrid

        x: 118
//        y: 23
        y: 1000
        width: 436
        height: 286

//            text: "全部"

        image: "images/top/4.png"

        onClicked: {
            parent.clicked("全部", 3)
        }
    }

    FlipButton {
        id: liuxingGrid

        x: 118
//        y: 316
        y: 1000
        width: 221
        height: 138

//            text: "流行"

        image: "images/top/5.png"

        onClicked: {
            parent.clicked("流行", 4)
        }
    }

    FlipButton {
        id: meinvGrid

        x: 345
//        y: 316
        y: 1000
        width: 212
        height: 138

//            text: "美女"

        image: "images/top/6.png"

        onClicked: {
//            parent.clicked("美女", 5)
        }
    }

    FlipButton {
        id: minnanGrid

        x: 563
//        y: 29
        y: 1000
        width: 212
        height: 136

//            text: "闽南"

        image: "images/top/7.png"

        onClicked: {
            parent.clicked("闽南", 6)
        }
    }

    FlipButton {
        id: xingeGrid

        x: 563
//        y: 173
        y: 1000
        width: 212
        height: 281

//            text: "新歌"

        image: "images/top/8.png"

        onClicked: {
            parent.clicked("新歌", 7)
        }
    }

    FlipButton {
        id: meinv2Grid

        x: 786
//        y: 29
        y: 1000
        width: 138
        height: 138

//            text: "美女2"

        image: "images/top/9.png"

        onClicked: {
//            parent.clicked("无", 8)
        }
    }

    FlipButton {
        id: duichangGrid

        x: 934
//        y: 29
        y: 1000
        width: 138
        height: 138

//            text: "对唱"

        image: "images/top/12.png"

        onClicked: {
            parent.clicked("对唱", 9)
        }
    }

    FlipButton {
        id: oumeiGrid

        x: 1083
//        y: 29
        y: 1000
        width: 112
        height: 138

//            text: "欧美"

        image: "images/top/13.png"

        onClicked: {
            parent.clicked("欧美", 10)
        }
    }

    FlipButton {
        id: lanseGrid

        x: 786
//        y: 173
        y: 1000
        width: 112
        height: 138

//            text: "蓝色"

        image: "images/top/10.png"

        onClicked: {
//            parent.clicked("无", 11)
        }
    }

    FlipButton {
        id: guoyuGrid

        x: 909
//        y: 173
        y: 1000
        width: 286
        height: 138

//            text: "国语"

        image: "images/top/14.png"

        onClicked: {
            parent.clicked("国语", 12)
        }
    }

    FlipButton {
        id: wangluoGrid

        x: 786
//        y: 318
        y: 1000
        width: 138
        height: 136

//            text: "网络"

        image: "images/top/11.png"

        onClicked: {
            parent.clicked("网络", 13)
        }
    }

    FlipButton {
        id: shuaigeGrid

        x: 934
//        y: 318
        y: 1000
        width: 138
        height: 136

//            text: "帅哥"

        image: "images/top/15.png"

        onClicked: {
            parent.clicked("帅哥", 14)
        }
    }

    FlipButton {
        id: yueyuGrid

        x: 1083
//        y: 318
        y: 1000
        width: 112
        height: 138

//            text: "粤语"

        image: "images/top/16.png"

        onClicked: {
            parent.clicked("粤语", 15)
        }
    }

    transform: [
        Rotation {
                id: rotationH
                origin.x: 0
                origin.y: 0
                axis.x: 0
                axis.y: 1
                axis.z: 0
                angle: 0
            },
        Rotation {
                id: rotationV
                origin.x: 0
                origin.y: 0
                axis.x: 1
                axis.y: 0
                axis.z: 0
                angle: 0
            }
    ]

    ParallelAnimation {
        id: animation

        RotationAnimation {
            target: rotationH
            properties: "angle"
            to:0
            from: 40
            duration: 1200
            direction: RotationAnimation.Counterclockwise
        }

        RotationAnimation {
            target: rotationV
            properties: "angle"
            to:0
            from: 40
            duration: 1200
            direction: RotationAnimation.Counterclockwise
        }

        PropertyAnimation {
            target: rankContent
            properties: "opacity"
            from: 0
            to: 1
            duration: 1200
        }

        SequentialAnimation {
            NumberAnimation {
                targets: [quanbuGrid, minnanGrid];
                properties: "y";
                from: 1000
                to: 29
                duration: 120
            }

            NumberAnimation {
                targets: [meinv2Grid];
                properties: "y";
                from: 1000
                to: 29
                duration: 120
            }

            NumberAnimation {
                targets: [duichangGrid, oumeiGrid];
                properties: "y";
                from: 1000
                to: 29
                duration: 120
            }

            NumberAnimation {
                targets: [secondGrid, xingeGrid];
                properties: "y";
                from: 1000
                to: 167
                duration: 120
            }

            NumberAnimation {
                targets: [secondGrid, xingeGrid];
                properties: "y";
                from: 1000
                to: 167
                duration: 120
            }

            NumberAnimation {
                targets: [lanseGrid];
                properties: "y";
                from: 1000
                to: 167
                duration: 120
            }

            ParallelAnimation {
                NumberAnimation {
                    targets: [guoyuGrid];
                    properties: "x";
                    from: 500
                    to: 909
                    duration: 200
                }

                NumberAnimation {
                    targets: [guoyuGrid];
                    properties: "y";
                    from: 1000
                    to: 167
                    duration: 200
                }

                NumberAnimation {
                    targets: [rihanGrid];
                    properties: "x";
                    from: 500
                    to: 0
                    duration: 200
                }

                NumberAnimation {
                    targets: [rihanGrid];
                    properties: "y";
                    from: 1000
                    to: 316
                    duration: 200
                }
            }

            NumberAnimation {
                targets: [liuxingGrid, meinvGrid];
                properties: "y";
                from: 1000
                to: 318
                duration: 120
            }

            NumberAnimation {
                targets: [wangluoGrid, yueyuGrid, shuaigeGrid];
                properties: "y";
                from: 1000
                to: 318
                duration: 120
            }
        }
    }

    Component.onCompleted: {
        animation.start()
    }
}
