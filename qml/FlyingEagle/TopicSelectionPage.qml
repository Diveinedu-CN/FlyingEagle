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
    color: "transparent"

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

        x: 906
        y: 190
        width: 96
        height: 204

        image: "images/主题分类/高清歌曲.png"

        onClicked: {
            handlerLoader("FinalMusicSelectionPage.qml", 0)
        }
    }

    PushButton {
        id: mingyao
        x: 51
        y: 298
        width: 96
        height: 96

        icon: "images/主题分类/民谣.png"
    }

    PushButton {
        id: xiqu

        x: 51
        y: 409
        width: 96
        height: 96

        icon: "images/主题分类/戏曲.png"
    }

    FlipButton {
        id: dujia

        x: 255
        y: 84
        width: 205
        height: 310

        isHorizontal: false

        image: "images/主题分类/独家.png"
    }

    FlipEdgeButton {
        id: junlv

        x: 257
        y: 409
        width: 96
        height: 96

        originX: 80
        originY: 80

        image: "images/主题分类/军旅.png"
    }

    FlipEdgeButton {
        id: mingzu

        x: 155
        y: 409
        width: 96
        height: 96

        originX: 80
        originY: 80

        image: "images/主题分类/民族.png"
    }

    FlipButton {
        id: jingdian

        x: 153
        y: 190
        width: 96
        height: 204

        image: "images/主题分类/经典老歌.png"
    }

    FlipEdgeButton {
        id: yingshi

        x: 1110
        y: 190
        width: 96
        height: 96

        image: "images/主题分类/影视.png"
    }

    FlipEdgeButton {
        id: xiaoyuan

        x: 1110
        y: 409
        width: 96
        height: 96

        image: "images/主题分类/校园.png"
    }

    PushButton {
        id: zhongguo

        x: 364
        y: 409
        width: 96
        height: 96

        icon: "images/主题分类/中国风.png"
    }

    PushButton {
        id: jueshi

        x: 51
        y: 84
        width: 96
        height: 96

        icon: "images/主题分类/爵士.png"
    }

    FlipButton {
        id: jieri

        x: 466
        y: 84
        width: 638
        height: 98

        isHorizontal: false

        image: "images/主题分类/节日.png"
    }

    FlipButton {
        id: nannv

        x: 466
        y: 190
        width: 206
        height: 315

        isHorizontal: false

        image: "images/主题分类/对唱.png"
    }

    FlipEdgeButton {
        id: randb

        x: 906
        y: 409
        width: 96
        height: 96

        originX: 40
        originY: 0

        isHorizontal: false

        image: "images/主题分类/R&B.png"
    }

    FlipEdgeButton {
        id: dianzi

        x: 1008
        y: 409
        width: 96
        height: 96

        originX: 40
        originY: 0

        isHorizontal: false

        image: "images/主题分类/电子.png"
    }

    PushButton {
        id: shengri

        x: 1110
        y: 298
        width: 96
        height: 96

        icon: "images/主题分类/生日.png"
    }

    PushButton {
        id: huanle

        x: 1110
        y: 84
        width: 96
        height: 96

        icon: "images/主题分类/欢乐庆典.png"
    }

    FlipButton {
        id: wangluo

        x: 686
        y: 190
        width: 208
        height: 96

        isHorizontal: false

        image: "images/主题分类/网络歌曲.png"
    }

    FlipButton {
        id: djhaige

        x: 686
        y: 300
        width: 208
        height: 96

        isHorizontal: false

        image: "images/主题分类/DJ.png"
    }

    PushButton {
        id: yaogun

        x: 686
        y: 409
        width: 96
        height: 96

        icon: "images/主题分类/摇滚.png"
    }

    PushButton {
        id: xiha

        x: 798
        y: 409
        width: 96
        height: 96

        icon: "images/主题分类/嘻哈.png"
    }

    PushButton {
        id: ertong

        x: 1008
        y: 190
        width: 96
        height: 96

        icon: "images/主题分类/儿童.png"
    }

    FlipEdgeButton {
        id: caoyuan

        x: 51
        y: 190
        width: 96
        height: 96

        image: "images/主题分类/草原.png"
    }

    FlipEdgeButton {
        id: lizhi

        x: 1008
        y: 298
        width: 96
        height: 96

        image: "images/主题分类/励志.png"
    }

    PushButton {
        id: chunyinyue

        x: 153
        y: 84
        width: 96
        height: 96

        icon: "images/主题分类/纯音乐.png"
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
