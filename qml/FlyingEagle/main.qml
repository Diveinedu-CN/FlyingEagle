import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Particles 2.0
//import "YGYKeyBoard"
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
        Loader {
            id: contentLoader
//            asynchronous: true
            visible: status==Loader.Ready?true:false
            source: "HomePage.qml"
        }

        //创建连接
        Connections {
            target: contentLoader.item
            ignoreUnknownSignals:true
            onHandlerLoader: {
                //切换目标页面由信号传入
                contentLoader.source = name
            }
            onHandleShowBaotai: {
                baotaigexing.showNumpad(title);
            }
            onHandleShowSingerInfo: {
                baotaigexing.showSingerInfo(starname);
            }
            onHandleShowMvPreview: {
                baotaigexing.showMvPreview(mv);
            }
            onHandleShowSecondFilter: {
                baotaigexing.showSecendFilter(inputType);
            }
        }

        Connections {
            target: mainMenu
            onHandlerLoader: {
                switch (index) {
                case 0:
                    contentLoader.source = "HomePage.qml"
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
        }
    }

    //在这里加入搜索条,这样就不会被弹窗阴影遮盖了
    /*
    TextField {
        id:searchBar
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        maximumLength: 20
        placeholderText: qsTr("S搜(歌星/歌名/歌词)")
        style: TextFieldStyle {
            id:style
            textColor: "#FFFFFFFF"
            background: Image {
                anchors.fill: parent
                anchors.leftMargin: -40
                anchors.rightMargin: 0
                source: "images/searchbar.png"
            }
            panel:Item {
                anchors.fill: parent
                property font font
                property color textColor: style.textColor
                property color selectionColor: style.selectionColor
                property color selectedTextColor: style.selectedTextColor
                implicitWidth: backgroundLoader.implicitWidth ? backgroundLoader.implicitWidth : 100
                implicitHeight: backgroundLoader.implicitHeight ? backgroundLoader.implicitHeight : 20
                property color placeholderTextColor: Qt.rgba(1, 1, 1, 0.5)
                Loader {
                    id: backgroundLoader
                    sourceComponent: background
                    anchors.fill: parent
                }
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                searchBar.forceActiveFocus();
                if(keyboard.state === "show")
                {
                    keyboard.state = "hide";
                    popContentAreaTimer.start();
                }else
                {
                    popContentArea.visible = true;
                    keyboard.state = "show";
                }
            }
        }
    }
    */
    SearchBarMenu {
        id:searchBarMenu
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10

        width: 330; height:316;
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
            interval: 500; running: false; repeat: false
            onTriggered: {
                popContentAreaYixuan.visible = !popContentAreaYixuan.visible;
            }
        }
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
        function handleTunningPage(index)
        {
            if(tunningPopupPage.visible == false)
            {
                tunningPopupPage.visible = true;
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
        Connections {
            target: mainMenu.fuwuButton
            ignoreUnknownSignals:true
            onClicked: {
                tunningPopupPage.handleTunningPage("fuwu");
            }
        }
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
    }
    //电影界面和优盘加歌界面
    MovieUDiskPage {
        id: movieUdiskAdd;
        width: 1280;
        height: 720;
        color: "#BF000000";
        visible: false;
    }

    ParticleSystem {
        id: particles
    }

    ImageParticle {
        system: particles
//        sprites: Sprite {
//            name: "bubble"
//            source: "images/bubble.png"
//            frameCount: 51
//            frameDuration: 40
//            frameDurationVariation: 8
//        }
        source: "images/bubble.png"
    }

    Emitter {
        system: particles
        emitRate: 20
        lifeSpan: 8000
        velocity: PointDirection { y:80; yVariation: 40; }
        acceleration: PointDirection { y: 4 }
        size: 60
        endSize: 12
        sizeVariation: 8
        width: parent.width
        height: 100
    }

//    Particles {
//        id: stars
//        x: 0; y: 0; width: parent.width; height: parent.height - 32
//        source: "images/btnQuit.png"
//        angleDeviation: 360
//        velocity: 0; velocityDeviation: 0
//        count: parent.width / 30
//        fadeInDuration: 2000
//        opacity: 3
//    }
}
