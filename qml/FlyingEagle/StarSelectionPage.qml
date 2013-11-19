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

    property var langArray: new Array("全部歌星", "热门", "港台男", "港台女", "大陆男", "大陆女", "日韩", "欧美", "网络", "组合", "其他")
    property var ablumArray: new Array("歌曲", "专辑")
    property var pathArray: new Array("歌星")
    property var pathArray2: new Array("歌星", "歌星名")

    signal handlerLoader(string name, int index)
    signal handleShowBaotai(variant cardPoint)
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

//                    gridLoader.source = "AlbumSelectionPage.qml"
                    gridLoader.sourceComponent = albumselectionpage;
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
                menuTabBar.selectButton(item.tag)
            }
        }

        Connections {
            target: menuTabBar2
            ignoreUnknownSignals: true
            onClicked: {
                menuTabBar2.selectButton(item.tag)

                switch(item.tag) {
                    case 0:
//                        gridLoader.source = "MusicAlbumSelectionPage.qml";
                        gridLoader.sourceComponent = musicalbumselectionpage;
                        break;
                    case 1:
//                        gridLoader.source = "PathAlbumSelectionPage.qml";
                        gridLoader.sourceComponent = pathalbumselectionpage;
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
//            source: "AlbumSelectionPage.qml"
            sourceComponent: albumselectionpage;
            Component {
                id: albumselectionpage;
                AlbumSelectionPage{

                }
            }
            Component {
                id: musicalbumselectionpage;
                MusicAlbumSelectionPage {

                }
            }

            Component {
                id: pathalbumselectionpage;
                PathAlbumSelectionPage {

                }
            }
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

//            gridLoader.source = "MusicAlbumSelectionPage.qml"
            gridLoader.sourceComponent = musicalbumselectionpage;
        }
    }

    Connections {
        target: gridLoader.item
        ignoreUnknownSignals: true
        onHandleBack: {
            navBar.visible = true
            menuTabBar.visible = true

            navBar2.visible = false
            menuTabBar2.visible = false

            menuTabBar2.selectButton(0)

//            gridLoader.source = "AlbumSelectionPage.qml"
            gridLoader.sourceComponent = albumselectionpage;
        }
    }

    //创建连接转发signal到最外层给main.qml,让其可以显示全屏报台 歌星简介 二次筛选输入框.
    Connections {
        target: gridLoader.item
        ignoreUnknownSignals:true
        onHandleShowBaotai: {
            starSelection.handleShowBaotai(cardPoint);
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
