/*
 *根据排名点歌
**/

import QtQuick 2.0

Rectangle {
    id: rank_selection;
    width: 1280
    height: 591
    color: "transparent"

    signal handlerLoader(string name, int index)
    signal handleShowBaotai(string title)
    signal handleShowSingerInfo(string starname)
    signal handleShowMvPreview(string mv)
    signal handleShowSecondFilter(string inputType)

    property var pathArray: new Array("排行榜")    
    //导航图标
    Image {
        id: navDiangeImage
        anchors.left: parent.left
        anchors.top: parent.top
        source: "images/diange.fw.png"
    }

//    //导航标题
//    Text {
//        id: navTitleLabel
//        anchors.left: navDiangeImage.right
//        anchors.leftMargin: 4
//        anchors.verticalCenter: navDiangeImage.verticalCenter
//        text: qsTr("点歌")
//        font.pixelSize: 24
//        color: "#FFFFFFFF"
//    }

    NavigationBar {
        id: navBar
        anchors.left: navDiangeImage.right
        anchors.leftMargin: 4
        anchors.verticalCenter: navDiangeImage.verticalCenter

        Component.onCompleted: {
            navBar.createButtons(pathArray)
        }
    }

    Connections {
        target: navBar
        ignoreUnknownSignals: true
        onClicked: {
            if(item.tag === 0) {
                if(pathArray.length == 1)
                    return

                pathArray.pop()
                navBar.createButtons(pathArray)

                contentLoader.source = "RankContent.qml"
            }
        }
    }

    Loader {
        id: contentLoader
        source: "RankContent.qml"
    }

    Connections {
        target: contentLoader.item
        ignoreUnknownSignals: true
        onClicked: {
            pathArray.push(name)
            navBar.createButtons(pathArray)

            contentLoader.source = "FinalRankMusicSelectionPage.qml"
        }
        //指定排行里页面下面的按钮条的事件转发
        onHandleShowBaotai: {
            rank_selection.handleShowBaotai(title);
        }
        onHandleShowSingerInfo: {
            rank_selection.handleSingerInfo(starname);
        }
        onHandleShowMvPreview: {
            rank_selection.handleShowMvPreview(mv);
        }
        onHandleShowSecondFilter: {
            rank_selection.handleShowSecondFilter(inputType);
        }
        onHandleLoader: {
            pathArray.pop()
            navBar.createButtons(pathArray)

            contentLoader.source = "RankContent.qml"
        }
    }
}
