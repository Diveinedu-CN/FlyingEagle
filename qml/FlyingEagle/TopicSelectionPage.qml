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

    FlipButton {
        id: gaoqing

        x: 213
        y: 84
        width: 80
        height: 160

        text: "高清歌曲"

        image: "images/dy-star.png"

        onClicked: {
            handlerLoader("FinalMusicSelectionPage.qml", 0)
        }
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

    FlipEdgeButton {
        id: junlv

        x: 299
        y: 256
        width: 80
        height: 80

        originX: 80
        originY: 80

        text: "军旅红歌"

        image: "images/dy-new.png"
    }

    FlipEdgeButton {
        id: mingzu

        x: 299
        y: 342
        width: 80
        height: 80

        originX: 80
        originY: 80

        text: "民族歌曲"

        image: "images/dy-new.png"
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

    FlipEdgeButton {
        id: yingshi

        x: 471
        y: 84
        width: 80
        height: 80

        text: "影视歌曲"

        image: "images/dy-new.png"
    }

    FlipEdgeButton {
        id: xiaoyuan

        x: 471
        y: 170
        width: 80
        height: 80

        text: "校园歌曲"

        image: "images/dy-new.png"
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

    FlipEdgeButton {
        id: randb

        x: 557
        y: 342
        width: 80
        height: 80

        originX: 40
        originY: 0

        isHorizontal: false

        text: "R&B"

        image: "images/dy-new.png"
    }

    FlipEdgeButton {
        id: dianzi

        x: 643
        y: 342
        width: 80
        height: 80

        originX: 40
        originY: 0

        isHorizontal: false

        text: "电子"

        image: "images/dy-new.png"
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

    FlipEdgeButton {
        id: caoyuan

        x: 901
        y: 168
        width: 80
        height: 80

        text: "草原歌曲"

        image: "images/dy-new.png"
    }

    FlipEdgeButton {
        id: lizhi

        x: 901
        y: 254
        width: 80
        height: 80

        text: "励志歌曲"

        image: "images/dy-new.png"
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

        PropertyAnimation {
            targets: [gaoqing, jingdian, dujia, jieri, nannv, djhaige, wangluo]
            property: "angle"
            duration: 2000
            from: -180
            to: 0
        }

        PropertyAnimation {
            targets: [yingshi, xiaoyuan, junlv, mingzu, randb, dianzi, caoyuan, lizhi]
            property: "angle"
            duration: 2000
            from: -180
            to: 0
        }

        PropertyAnimation {
            targets: [shengri, huanle, ertong, mingyao, xiqu, zhongguo, jueshi, yaogun, xiha, chunyinyue]
            property: "opacity"
            duration: 4000
            from: 0
            to: 1
        }
    }

    Component.onCompleted: {
        enterAnimation.start()
    }
}
