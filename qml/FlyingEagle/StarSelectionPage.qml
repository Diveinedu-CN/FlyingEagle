/*
 *根据歌星选择歌曲
**/

import QtQuick 2.0
import "componentCreation.js" as ComponentCreation

Rectangle {
    id: starSelection;
    width: 1280
    height: 591
    color: "transparent"

    property var langArray: new Array("全部", "国语", "粤语", "闽南语", "外语", "网络", "独家")
    property var ablumArray: new Array("歌曲", "专辑")
    property var pathArray: new Array("歌星")
    property var pathArray2: new Array("歌星", "歌星名")

    signal handlerLoader(string name, int index)
    signal handleShowBaotai(string title)
    signal handleShowSingerInfo(string starname)
    signal handleShowMvPreview(string mv)
    signal handleShowSecondFilter(string inputType)
    Item {
        id: tabbarId

        anchors.left: parent.left
        anchors.top: parent.top
        width: parent.width

        //导航图标
        Image {
            id: navDiangeImage
            anchors.left: parent.left
            anchors.top: parent.top
            source: "images/diange.fw.png"
        }

        NavigationBar {
            id: navBar2
            anchors.left: navDiangeImage.right
            visible: false

            Component.onCompleted: {
                navBar2.createButtons(pathArray2)
            }
        }

        NavigationBar {
            id: navBar
            anchors.left: navDiangeImage.right

            Component.onCompleted: {
                navBar.createButtons(pathArray)
            }
        }

        Connections {
            target: navBar2
            ignoreUnknownSignals: true
            onClicked: {
                if(item.tag === 0) {
                    menuTabBar.visible = true
                    menuTabBar2.visible = false
                    navBar.visible = true
                    navBar2.visible = false
                    gridLoader.source = "AlbumSelectionPage.qml"
                }
            }
        }

        //Tab标签栏
        Image {
            id: tabBar
            anchors.left: parent.left
            anchors.top: navDiangeImage.bottom
            source: "images/daohangtiao.png"
        }

        MenuTabBar {
            id: menuTabBar2
            anchors.left: tabBar.left
            anchors.top: tabBar.top
            visible: false

            Component.onCompleted: {
                menuTabBar2.createButtons(ablumArray)
            }
        }

        MenuTabBar {
            id: menuTabBar
            anchors.left: tabBar.left
            anchors.top: tabBar.top

            Component.onCompleted: {
                menuTabBar.createButtons(langArray)
            }
        }

        Connections {
            target: menuTabBar
            ignoreUnknownSignals: true
            onClicked: {
                console.log(item.tag)
            }
        }

        Connections {
            target: menuTabBar2
            ignoreUnknownSignals: true
            onClicked: {
                switch(item.tag) {
                    case 0:
                        gridLoader.source = "MusicAlbumSelectionPage.qml";
                        break;
                    case 1:
                        gridLoader.source = "PathAlbumSelectionPage.qml";
                        break;
                    default:
                        break;
                }
            }
        }
    }

////////////////////////////////////
    Rectangle {
        width: 1280
        height: 591
        color: "transparent"

        anchors.left: parent.left
        anchors.top: tabbarId.bottom

        Loader {
            id: gridLoader
            source: "AlbumSelectionPage.qml"
        }
    }

    Connections{
        target: gridLoader.item
        ignoreUnknownSignals: true
        onClicked: {
            navBar.visible = false
            menuTabBar.visible = false

            navBar2.visible = true
            menuTabBar2.visible = true

            gridLoader.source = "MusicAlbumSelectionPage.qml"
        }
    }

    //创建连接转发signal到最外层给main.qml,让其可以显示全屏报台 歌星简介 二次筛选输入框.
    Connections {
        target: gridLoader.item
        ignoreUnknownSignals:true
        onHandleShowBaotai: {
            starSelection.handleShowBaotai(title);
        }
        onHandleShowSingerInfo: {
            starSelection.handleShowSingerInfo(starname);
        }
        onHandleShowMvPreview: {
            starSelection.handleShowMvPreview(mv);
        }
        onHandleShowSecondFilter: {
            starSelection.handleShowSecondFilter(inputType);
        }
    }
}
