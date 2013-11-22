/*
 * 主页面文件
 *
 * 开发团队: 月光涯信息科技有限公司
 * 官方网址: www.yueguangya.com
 *
 * 功能: 主窗口UI, 提供整个应用的基础框架; 将主界面从上至下分为上部工具条mainMenu (MainBar文件定义),
 * 内容区域contentArea和下部主工具条mainToolBar (MainToolBar文件定义)三部分. 其中内容区域和上部工具条mainMenu
 * 还提供了遮盖阴影层popContentArea, 用来统一放置所有的弹出窗口; 内容区域负责所有页面的展示和切换.
**/

import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Particles 2.0
import "KeyBoard"

Rectangle {
    width: 1280
    height: 720

    //背景图
    Image {
        anchors.fill: parent
        source: "images/wallpaper.jpg"
    }

    //上部菜单栏
    MainBar {
        id: mainMenu
        height: 60
        anchors.top: parent.top
    }

    //内容区域
    Rectangle {
        id: contentArea
        width: parent.width
        height: 591
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: mainMenu.bottom
        anchors.bottom: mainToolBar.top
        color: "transparent"
        anchors.bottomMargin: -26

        signal handlerLoader(string name, int index)

        /*
         * contentLoader负责主页面上5个类别的切换, 不同的类别由不同的Component负责显示
         **/
        Loader {
            id: contentLoader
//            asynchronous: true
            visible: status==Loader.Ready?true:false
//            source: "HomePage.qml"
            sourceComponent: homepage;

            //主页面(首页)
            Component {
                id: homepage;
                HomePage {
                }
            }

            //语种选择页
            Component {
                id: langselectionpage;
                LangSelectionPage {
                }
            }

            //收藏页
            Component {
                id: favoritepage;
                FavoritePage {
                }
            }

            //歌星选择页
            Component {
                id: starselectionpage;
                StarSelectionPage {
                }
            }

            //主题选择页
            Component {
                id: topicselectionpage;
                TopicSelectionPage {
                }
            }

            //排行选择页
            Component {
                id: rankselectionpage;
                RankSelectionPage {
                }
            }

            //歌名选择页
            Component {
                id: musicselectionpage;
                MusicSelectionPage {
                }
            }

            //新歌选择页
            Component {
                id: newmusicselectionpage;
                NewMusicSelectionPage {
                }
            }
        }

        Image {
            id: musicNote
            width: 90;
            height: 116;
            opacity: 0;
            scale: 0;
            source: "images/music.png"
            SequentialAnimation {
                id:musicNoteAnimation
//                loops: Animation.Infinite
                running: false
                property int duration0: 400;
                property int duration1: 600;
                property point startPoint: Qt.point(x,y);
                property int endX: 0;
                ParallelAnimation {
                    NumberAnimation { target: musicNote; property: "x";from:musicNoteAnimation.startPoint.x; to:musicNoteAnimation.endX; duration: musicNoteAnimation.duration0 }
                    NumberAnimation { target: musicNote; property: "y"; easing.type: Easing.OutBack;from:musicNoteAnimation.startPoint.y; to:musicNoteAnimation.startPoint.y-50; duration: musicNoteAnimation.duration0 }
                    NumberAnimation { target: musicNote; property: "scale";  from:0.5; to:1; duration: musicNoteAnimation.duration0 }
                    NumberAnimation { target: musicNote; property: "opacity";from:0.5; to:1; duration: musicNoteAnimation.duration0 }
                }

                ParallelAnimation {
                    NumberAnimation { target: musicNote; property: "x";to:1280; duration: musicNoteAnimation.duration1 }
                    NumberAnimation { target: musicNote; property: "y";to:550; duration: musicNoteAnimation.duration1 }
                    NumberAnimation { target: musicNote; property: "scale"; from:1; to:0.4; duration: musicNoteAnimation.duration1 }
                    NumberAnimation { target: musicNote; property: "opacity";from:1; to:0.2; duration: musicNoteAnimation.duration1 }
                }
            }
        }
        //创建连接
        Connections {
            target: contentLoader.item
            ignoreUnknownSignals:true
            onHandlerLoader: {
                //切换目标页面由信号传入
//                contentLoader.source = name
                switch(name)
                {
                case "HomePage.qml":                //返回首页
                    contentLoader.sourceComponent = homepage;
                    break;
                case "LangSelectionPage.qml":       //进入语种选择
                    contentLoader.sourceComponent = langselectionpage;
                    break;
                case "FavoritePage.qml":            //进入收藏页
                    contentLoader.sourceComponent = favoritepage;
                    break;
                case "StarSelectionPage.qml":       //进入歌星选择页
                    contentLoader.sourceComponent = starselectionpage;
                    break;
                case "TopicSelectionPage.qml":      //进入主题选择
                    contentLoader.sourceComponent = topicselectionpage;
                    break;
                case "RankSelectionPage.qml":       //进入排行页
                    contentLoader.sourceComponent = rankselectionpage;
                    break;
                case "MusicSelectionPage.qml":      //歌名旋转页
                    contentLoader.sourceComponent = musicselectionpage;
                    break;
                case "NewMusicSelectionPage.qml":   //新歌选择页
                    contentLoader.sourceComponent = newmusicselectionpage;
                    break;
                default:
                    contentLoader.source = name;
                }
            }

            //显示报台
            onHandleShowBaotai: {
                musicNoteAnimation.startPoint = cardPoint;
                if(cardPoint.x>800)
                {
                    musicNoteAnimation.endX = cardPoint.x-200;
                }else
                {
                    musicNoteAnimation.endX = cardPoint.x+200;
                }

                console.log("cardPoint:"+cardPoint);
                baotaigexing.showNumpad(cardPoint);
            }

            //显示歌手信息
            onHandleShowSingerInfo: {
                baotaigexing.showSingerInfo(starname);
            }

            //显示MV预览
            onHandleShowMvPreview: {
                baotaigexing.showMvPreview(mv);
            }

            //显示二次筛选
            onHandleShowSecondFilter: {
                baotaigexing.showSecendFilter(inputType);
            }
        }

        Connections {
            target: mainMenu
            onHandlerLoader: {
                switch (index) {
                case 0:
//                    contentLoader.source = "HomePage.qml"
                    contentLoader.sourceComponent = homepage;
                    break;
                }
            }
        }
    }

    //输入法弹窗阴影遮盖层,默认不显示,作为弹窗视图所在图层
    Rectangle {
        id: popContentArea
        x: 0
        y: 0
        width: parent.width
        height: 651
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: mainToolBar.top
        anchors.bottomMargin: -26
        color: "#88000000"
        anchors.leftMargin: 0
        anchors.topMargin: 0
        visible: false

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(keyboard.state === "show")
                {
                    keyboard.state = "hide";
                    popContentAreaTimer.start();
                }
            }

        }

//        YGYKeyBoard {
        KeyBoard {
            id:keyboard;
            anchors.left: parent.left;
            anchors.leftMargin: 245;
            onNeedHide:
            {
                keyboard.state = "hide";
                popContentAreaTimer.start();
            }
        }
    }

    //输入法 弹窗阴影遮盖层 消失定时器
    Timer {
        id:popContentAreaTimer
        interval: 150; running: true; repeat: false
        onTriggered: {
            popContentArea.visible = false;
            searchBarMenu.menuList.needdisplay = false;
        }
    }

    //在这里加入搜索条,这样就不会被弹窗阴影遮盖了
    SearchBarMenu {
        id:searchBarMenu
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10

        width: 330; height:316;

        onHandleSearch: {
            contentLoader.source = "SearchResultPage.qml"
        }
    }

    //已选弹窗阴影遮盖层,默认不显示,比搜索栏更上一层
    Rectangle {
        id: popContentAreaYixuan
        x: 0
        y: 0
        width: parent.width
        height: 651
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: mainToolBar.top
        anchors.bottomMargin: -26
        color: "#BF000000"
        anchors.leftMargin: 0
        anchors.topMargin: 0
        visible: false

        MouseArea {
            anchors.fill: parent
            onClicked: {
                yixuanLoader.item.showUp(false);
                popContentAreaYixuanTimer.start();
            }
        }

        Timer {
            id:popContentAreaYixuanTimer
            interval: 350; running: false; repeat: false
            onTriggered: {
                popContentAreaYixuan.visible = !popContentAreaYixuan.visible;
            }
        }

        //已选加载器
        Loader {
            id: yixuanLoader
            sourceComponent: yixuanComponent;
            Component {
                id: yixuanComponent
                SelectedSongPage {

                }
            }
        }

        //建立信号连接处理点击已选或已选气泡
        Connections {
            target: mainToolBar.yixuanButton
            ignoreUnknownSignals:true
            onClicked: {
                if (popContentAreaYixuan.visible==true)
                {
                    yixuanLoader.item.showUp(false);
                    popContentAreaYixuanTimer.start();
                }else
                {
                    popContentAreaYixuan.visible = true;
                    yixuanLoader.item.showUp(true);
                    popContentArea.visible = false;
                    tunningPopupPage.visible = false;
                }
            }
        }

        Connections {
            target: mainToolBar.yixuanQiPao
            ignoreUnknownSignals:true
            onClicked: {
                if (popContentAreaYixuan.visible==true)
                {
                    yixuanLoader.item.showUp(false);
                    popContentAreaYixuanTimer.start();
                }else
                {
                    popContentAreaYixuan.visible = true;
                    yixuanLoader.item.showUp(true);
                    popContentArea.visible = false;
                    tunningPopupPage.visible = false;
                }

            }
        }
        Connections {
            target: yixuanLoader.item.selectedCloseButton
            ignoreUnknownSignals:true
            onClicked: {
                popContentAreaYixuanTimer.start();
            }
        }
    }

    //调音气氛辅助按钮弹出页面
    Rectangle {
        id: tunningPopupPage
        x: 0
        y: 0
        width: parent.width
        height: 651
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: mainToolBar.top
        anchors.bottomMargin: -26
        color: "#BF000000"
        anchors.leftMargin: 0
        anchors.topMargin: 0
        visible: false

        //
        function handleTunningPage(index)
        {
            if(tunningPopupPage.visible == false)
            {
                tunningPopupPage.visible = true;
                popContentArea.visible = false;
                popContentAreaYixuan.visible = false;
            }else
            {
                tunningPopupPage.visible = false
            }

            switch(index)
            {
            case "tiaoyin":
                tunningLoader.item.showTiaoYin();
                break;
            case "qifen":
                tunningLoader.item.showQiFen();

                break;
            case "fuzhu":
                tunningLoader.item.showFuZhu();
                break;
            case "fuwu":
                tunningLoader.item.showFuWu();
                break;
            default:
                break;
            }
        }

        //调音
        MouseArea {
            anchors.fill: parent
            onClicked: {
                tunningPopupPage.handleTunningPage("");
            }
        }
        Component {
            id: tunningComponent
            TunningPage {
            }
        }
        Loader {
            id: tunningLoader
            sourceComponent: tunningComponent;
        }

        Connections {
            target: mainToolBar.tiaoyinButton
            ignoreUnknownSignals:true
            onClicked: {
                tunningPopupPage.handleTunningPage("tiaoyin");
            }
        }
        Connections {
            target: tunningLoader.item
            ignoreUnknownSignals:true
            onCloseTunningClicked: {
                tunningPopupPage.handleTunningPage("tiaoyin");
            }
        }
        //气氛框右上角关闭按钮点击处理
        Connections {
            target: tunningLoader.item
            ignoreUnknownSignals:true
            onCloseQifenClicked: {
                tunningPopupPage.handleTunningPage("qifen");
            }
            onHandWriteGreetingClicked: {
                baotaigexing.showSendGreetings();
            }
        }
        Connections {
            target: mainToolBar.qifenButton
            ignoreUnknownSignals:true
            onClicked: {
                tunningPopupPage.handleTunningPage("qifen");
            }
        }
        //辅助
        Connections {
            target: tunningLoader.item
            ignoreUnknownSignals:true
            onCloseFuzhuClicked: {
                tunningPopupPage.handleTunningPage("fuzhu");
            }
        }
        //辅助
        Connections {
            target: mainToolBar.fuzhuButton
            ignoreUnknownSignals:true
            onClicked: {
                tunningPopupPage.handleTunningPage("fuzhu");
            }
        }
        //服务
        Connections {
            target: tunningLoader.item
            ignoreUnknownSignals:true
            onCloseFuwuClicked: {
                tunningPopupPage.handleTunningPage("fuwu");
            }
            onMovieButtonClicked: {
                movieUdiskAdd.showMovie();
            }
            onUdiskAddButtonClicked: {
                movieUdiskAdd.showUDisk();
            }
        }
        //一时偷懒, 没有将按钮和文本合并为同一个按钮
        //服务按钮
        Connections {
            target: mainMenu.fuwuButton
            ignoreUnknownSignals:true
            onClicked: {
                tunningPopupPage.handleTunningPage("fuwu");
            }
        }
        //服务文本
        Connections {
            target: mainMenu.fuwuText
            ignoreUnknownSignals:true
            onClicked: {
                tunningPopupPage.handleTunningPage("fuwu");
            }
        }
    }

    //下部工具条
    MainToolBar {
        id: mainToolBar
        width: parent.width
        height: 95
        anchors.bottom: parent.bottom
        backgroundImage: "images/bar.png"
        color: "transparent"
    }

    //报台歌星简介置顶框
    BaotaiGexingJianJiePage {
        id: baotaigexing;
        width: 1280;
        height: 720;
        color: "#BF000000";
        visible: false;
        onConfirmClicked: {
            musicNoteAnimation.stop();
            musicNoteAnimation.start();
        }
    }
    //电影界面和优盘加歌界面
    MovieUDiskPage {
        id: movieUdiskAdd;
        width: 1280;
        height: 720;
        color: "#BF000000";
        visible: false;
    }


}
