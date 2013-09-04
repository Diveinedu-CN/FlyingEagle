import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import "YGYKeyBoard"

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
            source: "HomePage.qml"
        }

        //创建连接
        Connections {
            target: contentLoader.item
            onHandlerLoader: {
                switch (index) {
                case 0:
                    contentLoader.source = "LangSelectionPage.qml";
                    break;
                case 1:
                    contentLoader.source = "FavoritePage.qml"
                    break;
                case 2:
                    contentLoader.source = "StarSelectionPage.qml"
                    break;
                case 3:
                    contentLoader.source = "TopicSelectionPage.qml"
                    break;
                case 4:
                    contentLoader.source = "RankSelectionPage.qml"
                    break;
                case 5:
                    contentLoader.source = "MusicSelectionPage.qml"
                    break;
                case 6:
                    contentLoader.source = "NewMusicSelectionPage.qml"
                    break;
                }
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

    //弹窗阴影遮盖层,默认不显示,作为弹窗视图所在图层
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
                parent.visible = false
            }

        }
        YGYKeyBoard {
            id:keyboard
        }
    }

    //在这里加入搜索条,这样就不会被弹窗阴影遮盖了
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
                    popContentArea.visible = false
                    keyboard.state = "hide";
                }else
                {
                    popContentArea.visible = true
                    keyboard.state = "show";
                }
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
}
