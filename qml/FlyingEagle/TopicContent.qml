/*
 * 主题点歌的主题分类内容页面
 *
 * 开发团队: 月光涯信息科技有限公司
 * 官方网址: www.yueguangya.com
 *
 *
**/
import QtQuick 2.0

Rectangle {
    id: container

    width: 1280
    height: 591
    color: "transparent"
    property int animationTime: 500

    signal clicked(string name, int index)
    signal handleBack()

    FlipButton {
        id: gaoqing

        x: 906
        y: 190
        width: 96
        height: 194

        image: "images/TopicCategory/gaoqinggequ.png"
        angle: -180

        onClicked: {
            parent.clicked("高清歌曲", 0)
        }
    }

    PushButton {
        id: mingyao
        x: 51
        y: 288
        width: 96
        height: 96
        opacity: 0

        icon: "images/TopicCategory/minyao.png"

        onClicked: {
            parent.clicked("民谣", 1)
        }
    }

    PushButton {
        id: xiqu

        x: 51
        y: 399
        width: 96
        height: 96
        opacity: 0

        icon: "images/TopicCategory/xiqu.png"

        onClicked: {
            parent.clicked("戏曲", 2)
        }
    }

    FlipButton {
        id: dujia

        x: 255
        y: 74
        width: 205
        height: 310
//        angle: -180
        opacity: 0

        isHorizontal: false

        image: "images/TopicCategory/dujia.png"

        onClicked: {
            parent.clicked("独家", 3)
        }
    }

    FlipEdgeButton {
        id: junlv

        x: 257
        y: 399
        width: 96
        height: 96
        angle: -180
        opacity: 0

        originX: 80
        originY: 80

        image: "images/TopicCategory/junlv.png"

        onClicked: {
            parent.clicked("军旅", 4)
        }
    }

    FlipEdgeButton {
        id: mingzu

        x: 155
        y: 399
        width: 96
        height: 96
        angle: -180
        opacity: 0

        originX: 80
        originY: 80

        image: "images/TopicCategory/minzu.png"

        onClicked: {
            parent.clicked("民族", 5)
        }
    }

    FlipButton {
        id: jingdian

        x: 153
        y: 180
        width: 96
        height: 204
        angle: -180

        image: "images/TopicCategory/jingdianlaoge.png"

        onClicked: {
            parent.clicked("经典老歌", 6)
        }
    }

    FlipEdgeButton {
        id: yingshi

        x: 1110
        y: 180
        width: 96
        height: 96
        angle: -180
        opacity: 0

        image: "images/TopicCategory/yingshi.png"

        onClicked: {
            parent.clicked("影视", 7)
        }
    }

    FlipEdgeButton {
        id: xiaoyuan

        x: 1110
        y: 399
        width: 96
        height: 96
        angle: -180
        opacity: 0

        image: "images/TopicCategory/xiaoyuan.png"

        onClicked: {
            parent.clicked("校园", 8)
        }
    }

    PushButton {
        id: zhongguo

        x: 364
        y: 399
        width: 96
        height: 96
        opacity: 0

        icon: "images/TopicCategory/zhongguofeng.png"

        onClicked: {
            parent.clicked("中国风", 9)
        }
    }

    PushButton {
        id: jueshi

        x: 51
        y: 74
        width: 96
        height: 96
        opacity: 0

        icon: "images/TopicCategory/jueshi.png"

        onClicked: {
            parent.clicked("爵士", 10)
        }
    }

    FlipButton {
        id: jieri

        x: 466
        y: 74
        width: 638
        height: 98
//        angle: -180
        opacity: 0

        isHorizontal: false

        image: "images/TopicCategory/jieri.png"

        onClicked: {
            parent.clicked("节日", 11)
        }
    }

    FlipButton {
        id: nannv

        x: 466
        y: 180
        width: 206
        height: 315
//        angle: -180
        opacity: 0

        isHorizontal: false

        image: "images/TopicCategory/duichang.png"

        onClicked: {
            parent.clicked("对唱", 12)
        }
    }

    FlipEdgeButton {
        id: randb

        x: 906
        y: 399
        width: 96
        height: 96
        angle: -180
        opacity: 0

        originX: 40
        originY: 0

        isHorizontal: false

        image: "images/TopicCategory/R&B.png"

        onClicked: {
            parent.clicked("R&B", 13)
        }
    }

    FlipEdgeButton {
        id: dianzi

        x: 1008
        y: 399
        width: 96
        height: 96
        angle: -180
        opacity: 0

        originX: 40
        originY: 0

        isHorizontal: false

        image: "images/TopicCategory/dianzi.png"

        onClicked: {
            parent.clicked("电子", 14)
        }
    }

    PushButton {
        id: shengri

        x: 1110
        y: 288
        width: 96
        height: 96
        opacity: 0

        icon: "images/TopicCategory/shengri.png"

        onClicked: {
            parent.clicked("生日", 15)
        }
    }

    PushButton {
        id: huanle

        x: 1110
        y: 74
        width: 96
        height: 96
        opacity: 0

        icon: "images/TopicCategory/huanleqingdian.png"

        onClicked: {
            parent.clicked("欢乐庆典", 16)
        }
    }

    FlipButton {
        id: wangluo

        x: 686
        y: 180
        width: 208
        height: 96
        angle: -180

        isHorizontal: false

        image: "images/TopicCategory/wangluogequ.png"

        onClicked: {
            parent.clicked("网络歌曲", 17)
        }
    }

    FlipButton {
        id: djhaige

        x: 686
        y: 290
        width: 208
        height: 96
        angle: -180

        isHorizontal: false

        image: "images/TopicCategory/DJ.png"

        onClicked: {
            parent.clicked("DJ", 18)
        }
    }

    PushButton {
        id: yaogun

        x: 686
        y: 399
        width: 96
        height: 96
        opacity: 0

        icon: "images/TopicCategory/yaogun.png"

        onClicked: {
            parent.clicked("摇滚", 19)
        }
    }

    PushButton {
        id: xiha

        x: 798
        y: 399
        width: 96
        height: 96
        opacity: 0

        icon: "images/TopicCategory/xiha.png"

        onClicked: {
            parent.clicked("嘻哈", 20)
        }
    }

    PushButton {
        id: ertong

        x: 1008
        y: 180
        width: 96
        height: 96
        opacity: 0

        icon: "images/TopicCategory/ertong.png"

        onClicked: {
            parent.clicked("儿童", 21)
        }
    }

    FlipEdgeButton {
        id: caoyuan

        x: 51
        y: 180
        width: 96
        height: 96
        angle: -180
        opacity: 0

        image: "images/TopicCategory/caoyuan.png"

        onClicked: {
            parent.clicked("草原", 22)
        }
    }

    FlipEdgeButton {
        id: lizhi

        x: 1008
        y: 288
        width: 96
        height: 96
        angle: -180
        opacity: 0

        image: "images/TopicCategory/lizhi.png"

        onClicked: {
            parent.clicked("励志", 23)
        }
    }

    PushButton {
        id: chunyinyue

        x: 153
        y: 74
        width: 96
        height: 96
        opacity: 0

        icon: "images/TopicCategory/chunyinyue.png"

        onClicked: {
            parent.clicked("纯音乐",24)
        }
    }

    SequentialAnimation {
        id: enterAnimation

        ParallelAnimation {
            PropertyAnimation {
                targets: [gaoqing, jingdian, djhaige, wangluo]
                property: "angle"
                duration: animationTime
                from: -180
                to: 0
            }

            PropertyAnimation {
                targets: [dujia, nannv, jieri]
                property: "opacity"
                duration: animationTime
                from: 0
                to: 1
            }
        }

        PropertyAnimation {
            targets: [yingshi, xiaoyuan, junlv, mingzu, randb, dianzi, caoyuan, lizhi]
            property: "opacity"
            duration: 10
            from: 0
            to: 1
        }

        PropertyAnimation {
            targets: [yingshi, xiaoyuan, junlv, mingzu, randb, dianzi, caoyuan, lizhi]
            property: "angle"
            duration: animationTime
            from: -180
            to: 0
        }

        PropertyAnimation {
            targets: [shengri, huanle, ertong, mingyao, xiqu, zhongguo, jueshi, yaogun, xiha, chunyinyue]
            property: "opacity"
            duration: animationTime * 2
            from: 0
            to: 1
        }
    }

    Component.onCompleted: {
        enterAnimation.start()
    }

    PushButton {
        id:back;
        width: 100; height: 44;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 20
        anchors.right: parent.right;
        anchors.rightMargin: 100;
        backgroundNormal: "images/back.png";
        onClicked: {
            container.handleBack("homePage.qml", 0)
        }
    }
}
