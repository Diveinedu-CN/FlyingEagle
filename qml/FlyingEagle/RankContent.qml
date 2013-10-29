import QtQuick 2.0

Item {
    x: 54
    y: 46
    width: 1280
    height: 504

    property int yAnimationTime: 120
    property int defaultScale: 1
    property int animationScale: 3
    property int ySrc: 1000
    property int xSrc: 1500

    signal handleBack(string name, int index)

    id: rankContent

//    anchors.topMargin: 4
//    anchors.top: navDiangeImage.bottom
//        color: "red"

    signal clicked(string name, int index)

    FlipButton {
        id: firstGrid

        x: 0
        y: 23
//        x: xSrc
//        y: ySrc
        width: 112
        height: 138

        scale: defaultScale

//            text: "第一个"

        image: "images/top/1.png"

        onClicked: {
//            handlerLoader("FinalRankMusicSelectionPage.qml", 0)
//            parent.clicked("无", 0)
        }
    }

    FlipButton {
        id: secondGrid

//        x: 0
//        y: 167
        x: xSrc
        y: ySrc
        width: 112
        height: 138
        isHorizontal: false

        scale: defaultScale

//            text: "第二个"

        frontImage: "images/top/2.png"
        backImage: "images/top/22.png"

        onClicked: {
//            parent.clicked("无", 1)
        }
    }

    FlipButton {
        id: rihanGrid

//        x: 0
//        y: 316
        x: xSrc
        y: ySrc
//        y: 1000
        width: 112
        height: 138

        scale: defaultScale

//            text: "日韩"

        image: "images/top/3.png"

        onClicked: {
            parent.clicked("日韩", 2)
        }
    }

    FlipButton {
        id: quanbuGrid

//        x: 118
//        y: 23
        x: xSrc
        y: ySrc
        width: 436
        height: 286

        scale: defaultScale

//            text: "全部"

        image: "images/top/4.png"

        onClicked: {
            parent.clicked("全部", 3)
        }
    }

    FlipButton {
        id: liuxingGrid

//        x: 118
//        y: 316
        x: xSrc
        y: ySrc
        width: 221
        height: 138

        scale: defaultScale

//            text: "流行"

        image: "images/top/5.png"

        onClicked: {
            parent.clicked("流行", 4)
        }
    }

    FlipButton {
        id: meinvGrid

//        x: 345
//        y: 316
        x: xSrc
        y: ySrc
        width: 212
        height: 138
        isHorizontal: false

        scale: defaultScale

//            text: "美女"

        frontImage: "images/top/6.png"
        backImage: "images/top/62.png"

        onClicked: {
//            parent.clicked("美女", 5)
        }
    }

    FlipButton {
        id: minnanGrid

//        x: 563
//        y: 29
        x: xSrc
        y: ySrc
        width: 212
        height: 136

        scale: defaultScale

//            text: "闽南"

        image: "images/top/7.png"

        onClicked: {
            parent.clicked("闽南", 6)
        }
    }

    FlipButton {
        id: xingeGrid

//        x: 563
//        y: 173
        x: xSrc
        y: ySrc
        width: 212
        height: 281

        scale: defaultScale

//            text: "新歌"

        image: "images/top/8.png"

        onClicked: {
            parent.clicked("新歌", 7)
        }
    }

    FlipButton {
        id: meinv2Grid

//        x: 786
//        y: 29
        x: xSrc
        y: ySrc
        width: 138
        height: 138
        isHorizontal: false

        scale: defaultScale

//            text: "美女2"

        frontImage: "images/top/9.png"
        backImage: "images/top/92.png"

        onClicked: {
//            parent.clicked("无", 8)
        }
    }

    FlipButton {
        id: duichangGrid

//        x: 934
//        y: 29
        x: xSrc
        y: ySrc
        width: 138
        height: 138

        scale: defaultScale

//            text: "对唱"

        image: "images/top/12.png"

        onClicked: {
            parent.clicked("对唱", 9)
        }
    }

    FlipButton {
        id: oumeiGrid

//        x: 1083
//        y: 29
        x: xSrc
        y: ySrc
        width: 112
        height: 138

        scale: defaultScale

//            text: "欧美"

        image: "images/top/13.png"

        onClicked: {
            parent.clicked("欧美", 10)
        }
    }

    FlipButton {
        id: lanseGrid

//        x: 786
//        y: 173
        x: xSrc
        y: ySrc
        width: 112
        height: 138

        scale: defaultScale

//            text: "蓝色"

        image: "images/top/10.png"

        onClicked: {
//            parent.clicked("无", 11)
        }
    }

    FlipButton {
        id: guoyuGrid

//        x: 909
//        y: 173
        x: xSrc
        y: ySrc
        width: 286
        height: 138

        scale: defaultScale

//            text: "国语"

        image: "images/top/14.png"

        onClicked: {
            parent.clicked("国语", 12)
        }
    }

    FlipButton {
        id: wangluoGrid

//        x: 786
//        y: 318
        x: xSrc
        y: ySrc
        width: 138
        height: 136

        scale: defaultScale

//            text: "网络"

        image: "images/top/11.png"

        onClicked: {
            parent.clicked("网络", 13)
        }
    }

    FlipButton {
        id: shuaigeGrid

//        x: 934
//        y: 318
        x: xSrc
        y: ySrc
        width: 138
        height: 136
        isHorizontal: false

        scale: defaultScale

//            text: "帅哥"

        frontImage: "images/top/15.png"
        backImage: "images/top/152.png"

        onClicked: {
//            parent.clicked("帅哥", 14)
        }
    }

    FlipButton {
        id: yueyuGrid

//        x: 1083
//        y: 318
        x: xSrc
        y: ySrc
        width: 112
        height: 138

        scale: defaultScale

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

    SequentialAnimation {
        id: animation

        ParallelAnimation {
            RotationAnimation {
                target: rotationH
                properties: "angle"
                easing.type: Easing.OutExpo
                to:0
                from: 80
                duration: 1000
                direction: RotationAnimation.Counterclockwise
            }

            RotationAnimation {
                target: rotationV
                properties: "angle"
                easing.type: Easing.OutExpo
                to:0
                from: 80
                duration: 1000
                direction: RotationAnimation.Counterclockwise
            }

            PropertyAnimation {
                target: rankContent
                properties: "opacity"
                from: 0.5
                to: 1
                duration: 1000
            }

            //从左到右动画时间由短变长, 在原有基础上改为从右下脚飞入
    //        NumberAnimation {
    //            targets: [quanbuGrid, minnanGrid, meinv2Grid, duichangGrid, oumeiGrid, secondGrid, xingeGrid, lanseGrid];
    //            properties: "scale";
    //            from: 3
    //            to: 1
    //            duration: yAnimationTime
    //        }

    //        SequentialAnimation {
    //            NumberAnimation {
    //                targets: [quanbuGrid, minnanGrid];
    //                properties: "scale";
    //                from: 5
    //                to: 1
    //                duration: yAnimationTime
    //            }

    //            NumberAnimation {
    //                targets: [meinv2Grid];
    //                properties: "scale";
    //                from: 5
    //                to: 1
    //                duration: yAnimationTime
    //            }

    //            NumberAnimation {
    //                targets: [duichangGrid, oumeiGrid];
    //                properties: "scale";
    //                from: 5
    //                to: 1
    //                duration: yAnimationTime
    //            }

    //            NumberAnimation {
    //                targets: [secondGrid, xingeGrid];
    //                properties: "scale";
    //                from: 5
    //                to: 1
    //                duration: yAnimationTime
    //            }

    //            NumberAnimation {
    //                targets: [secondGrid, xingeGrid];
    //                properties: "scale";
    //                from: 5
    //                to: 1
    //                duration: yAnimationTime
    //            }

    //            NumberAnimation {
    //                targets: [lanseGrid];
    //                properties: "scale";
    //                from: 5
    //                to: 1
    //                duration: yAnimationTime
    //            }
    //        }

            SequentialAnimation {
                ParallelAnimation {
                    NumberAnimation {
                        targets: [quanbuGrid, minnanGrid];
                        properties: "y";
                        from: 1000
                        to: 29
                        duration: yAnimationTime
                    }
                    NumberAnimation {
                        targets: [quanbuGrid];
                        properties: "x";
                        from: 1000
                        to: 118
                        duration: yAnimationTime
                    }
                    NumberAnimation {
                        targets: [minnanGrid];
                        properties: "x";
                        from: 1000
                        to: 563
                        duration: yAnimationTime
                    }
                }

                ParallelAnimation {
                    NumberAnimation {
                        targets: [meinv2Grid];
                        properties: "y";
                        from: 1000
                        to: 29
                        duration: yAnimationTime
                    }
                    NumberAnimation {
                        targets: [meinv2Grid];
                        properties: "x";
                        from: 1000
                        to: 786
                        duration: yAnimationTime
                    }
                }

                ParallelAnimation {
                    NumberAnimation {
                        //934, 1083
                        targets: [duichangGrid, oumeiGrid];
                        properties: "y";
                        from: 1000
                        to: 29
                        duration: yAnimationTime
                    }
                    NumberAnimation {
                        //934, 1083
                        targets: [duichangGrid];
                        properties: "x";
                        from: 1000
                        to: 934
                        duration: yAnimationTime
                    }
                    NumberAnimation {
                        //934, 1083
                        targets: [oumeiGrid];
                        properties: "x";
                        from: 1000
                        to: 1083
                        duration: yAnimationTime
                    }
                }

                ParallelAnimation {
                    NumberAnimation {
                        targets: [secondGrid, xingeGrid];
                        properties: "y";
                        from: 1000
                        to: 167
                        duration: yAnimationTime
                    }
                    NumberAnimation {
                        targets: [secondGrid];
                        properties: "x";
                        from: 1000
                        to: 0
                        duration: yAnimationTime
                    }
                    NumberAnimation {
                        targets: [xingeGrid];
                        properties: "x";
                        from: 1000
                        to: 563
                        duration: yAnimationTime
                    }
                }

                ParallelAnimation {
                    NumberAnimation {
                        targets: [lanseGrid];
                        properties: "y";
                        from: 1000
                        to: 167
                        duration: yAnimationTime
                    }
                    NumberAnimation {
                        targets: [lanseGrid];
                        properties: "x";
                        from: 1000
                        to: 786
                        duration: yAnimationTime
                    }
                }

                ParallelAnimation {
                    NumberAnimation {
                        targets: [guoyuGrid];
                        properties: "x";
                        from: 500
                        to: 909
                        duration: yAnimationTime
                    }

                    NumberAnimation {
                        targets: [guoyuGrid];
                        properties: "y";
                        from: 1000
                        to: 167
                        duration: yAnimationTime
                    }

                    NumberAnimation {
                        targets: [rihanGrid];
                        properties: "x";
                        from: 500
                        to: 0
                        duration: yAnimationTime
                    }

                    NumberAnimation {
                        targets: [rihanGrid];
                        properties: "y";
                        from: 1000
                        to: 316
                        duration: yAnimationTime
                    }
                }

                ParallelAnimation {
                    NumberAnimation {
                        targets: [liuxingGrid, meinvGrid];
                        properties: "y";
                        from: 1000
                        to: 318
                        duration: yAnimationTime
                    }
                    NumberAnimation {
                        targets: [liuxingGrid];
                        properties: "x";
                        from: 1000
                        to: 118
                        duration: yAnimationTime
                    }
                    NumberAnimation {
                        targets: [meinvGrid];
                        properties: "x";
                        from: 1000
                        to: 345
                        duration: yAnimationTime
                    }
                }

                ParallelAnimation {
                    NumberAnimation {
                        targets: [wangluoGrid, yueyuGrid, shuaigeGrid];
                        properties: "y";
                        from: 1000
                        to: 318
                        duration: yAnimationTime
                    }
                    NumberAnimation {
                        targets: [wangluoGrid];
                        properties: "x";
                        from: 1000
                        to: 786
                        duration: yAnimationTime
                    }
                    NumberAnimation {
                        targets: [yueyuGrid];
                        properties: "x";
                        from: 1000
                        to: 1083
                        duration: yAnimationTime
                    }
                    NumberAnimation {
                        targets: [shuaigeGrid];
                        properties: "x";
                        from: 1000
                        to: 934
                        duration: yAnimationTime
                    }
                }
            }
        }

        PropertyAnimation {
            targets: [secondGrid]
            property: "angle"
            duration: 1000
            from: 180
            to: 0
        }

        PropertyAnimation {
            targets: [meinv2Grid]
            property: "angle"
            duration: 1000
            from: 180
            to: 0
        }

        PropertyAnimation {
            targets: [meinvGrid]
            property: "angle"
            duration: 1000
            from: 180
            to: 0
        }

        PropertyAnimation {
            targets: [shuaigeGrid]
            property: "angle"
            duration: 1000
            from: 180
            to: 0
        }
    }

    Component.onCompleted: {
        animation.start()
    }

    PushButton {
        id:back;
        width: 100; height: 44;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: -20
        anchors.right: parent.right;
        anchors.rightMargin: 100;
        backgroundNormal: "images/back.png";
        onClicked: {
            rankContent.handleBack("homePage.qml", 0)
        }
    }
}
