/*
 *根据主题选择歌曲
**/

import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

Rectangle {
    width: 1280
    height: 591
    color: "orange"

    signal handlerLoader(string name, int index)

    FlipButton {
        id: gaoqing

        x: 213
        y: 84
        width: 80
        height: 160

        text: "高清歌曲"

        image: "images/dy-star.png"
    }

    PushButton {
        id: mingyao
        x: 213
        y: 256
        width: 80
        height: 80

        text: "民谣"

        color: "green"
    }

    PushButton {
        id: xiqu

        x: 213
        y: 342
        width: 80
        height: 80

        text: "戏曲片段"

        color: "yellow"
    }

    FlipButton {
        id: dujia

        x: 299
        y: 84
        width: 166
        height: 166

        isHorizontal: false

        text: "独家歌曲"

        image: "images/dy-star.png"
    }

    PushButton {
        id: junlv

        x: 299
        y: 256
        width: 80
        height: 80

        text: "军旅红歌"

        color: "cyan"
    }

    PushButton {
        id: mingzu

        x: 299
        y: 342
        width: 80
        height: 80

        text: "民族歌曲"

        color: "darkcyan"
    }

    FlipButton {
        id: jingdian

        x: 385
        y: 256
        width: 80
        height: 166

        text: "经典老歌"

        image: "images/dy-star.png"
    }

    PushButton {
        id: yingshi

        x: 471
        y: 84
        width: 80
        height: 80

        text: "影视歌曲"

        color: "gray"
    }

    PushButton {
        id: xiaoyuan

        x: 471
        y: 170
        width: 80
        height: 80

        text: "校园歌曲"

        color: "pink"
    }

    PushButton {
        id: zhongguo

        x: 471
        y: 256
        width: 80
        height: 80

        text: "中国风"

        color: "aqua"
    }

    PushButton {
        id: jueshi

        x: 471
        y: 342
        width: 80
        height: 80

        text: "爵士"

        color: "bisque"
    }

    FlipButton {
        id: jieri

        x: 557
        y: 84
        width: 166
        height: 80

        isHorizontal: false

        text: "节日"

        image: "images/dy-star.png"
    }

    FlipButton {
        id: nannv

        x: 557
        y: 170
        width: 166
        height: 166

        isHorizontal: false

        text: "男女对唱"

        image: "images/dy-star.png"
    }

    PushButton {
        id: randb

        x: 557
        y: 342
        width: 80
        height: 80

        text: "R&B"

        color: "coral"
    }

    PushButton {
        id: dianzi

        x: 643
        y: 342
        width: 80
        height: 80

        text: "电子"

        color: "cornsilk"
    }

    PushButton {
        id: shengri

        x: 729
        y: 84
        width: 80
        height: 80

        text: "生日祝福"

        color: "crimson"
    }

    PushButton {
        id: huanle

        x: 815
        y: 84
        width: 80
        height: 80

        text: "欢乐庆典"

        color: "orangered"
    }

    FlipButton {
        id: wangluo

        x: 729
        y: 170
        width: 166
        height: 80

        isHorizontal: false

        text: "网络歌曲"

        image: "images/dy-star.png"
    }

    FlipButton {
        id: djhaige

        x: 729
        y: 256
        width: 166
        height: 80

        isHorizontal: false

        text: "DJ嗨歌"

        image: "images/dy-star.png"
    }

    PushButton {
        id: yaogun

        x: 729
        y: 342
        width: 80
        height: 80

        text: "摇滚"

        color: "olive"
    }

    PushButton {
        id: xiha

        x: 815
        y: 342
        width: 80
        height: 80

        text: "嘻哈"

        color: "orchid"
    }

    PushButton {
        id: ertong

        x: 901
        y: 84
        width: 80
        height: 80

        text: "儿童歌曲"

        color: "darkviolet"
    }

    PushButton {
        id: caoyuan

        x: 901
        y: 168
        width: 80
        height: 80

        text: "草原歌曲"

        color: "peru"
    }

    PushButton {
        id: lizhi

        x: 901
        y: 254
        width: 80
        height: 80

        text: "励志歌曲"

        color: "plum"
    }

    PushButton {
        id: chunyinyue

        x: 901
        y: 340
        width: 80
        height: 80

        text: "纯音乐"

        color: "fuchsia"
    }

    SequentialAnimation {
        id: enterAnimation

        RotationAnimation {
            targets: [gaoqing, jingdian, dujia, jieri, nannv, djhaige, wangluo]
            direction: RotationAnimation.Clockwise
            property: "angle"
            duration: 2000
            from: 180
            to: 0
        }
    }

    Component.onCompleted: {
        enterAnimation.start()
    }
}
