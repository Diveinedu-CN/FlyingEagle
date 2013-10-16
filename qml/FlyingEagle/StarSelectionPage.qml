/*
 *根据歌星选择歌曲
**/

import QtQuick 2.0
import "componentCreation.js" as ComponentCreation

Rectangle {
    width: 1280
    height: 591
    color: "transparent"

    property var langArray: new Array("全部", "国语", "粤语", "闽南语", "外语", "网络", "独家")

    signal handlerLoader(string name, int index)

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
            id: navBar
            anchors.left: navDiangeImage.right

            Component.onCompleted: {
                navBar.createButtons(langArray)
            }
        }

        Connections {
            target: navBar
            ignoreUnknownSignals: true
            onClicked: {
                console.log(item.tag)
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
    }

////////////////////////////////////
    Rectangle {
        width: 1280
        height: 591
        color: "transparent"

        anchors.left: parent.left
        anchors.top: menuTabBar.bottom

        Loader {
            id: gridLoader
            source: "AlbumSelectionPage.qml"
        }
    }

    Connections{
        target: gridLoader.item
        ignoreUnknownSignals: true
        onClicked: {
            gridLoader.source = "MusicAlbumSelectionPage.qml"
        }
    }
}
