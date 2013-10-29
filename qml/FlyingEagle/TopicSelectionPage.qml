/*
 *根据主题选择歌曲
**/

import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

Rectangle {
    id: topicPage

    width: 1280
    height: 591
    color: "transparent"

    property var pathArray: new Array("主题分类")

    signal handlerLoader(string name, int index)

    //导航图标
    Image {
        id: navDiangeImage
        anchors.left: parent.left
        anchors.top: parent.top
        source: "images/diange.fw.png"
    }

    //导航标题
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

                contentLoader.source = "TopicContent.qml"
            }
        }
    }

    Loader {
        id: contentLoader
        source: "TopicContent.qml"
    }

    Connections {
        target: contentLoader.item
        ignoreUnknownSignals: true
        onClicked: {
            pathArray.push(name)
            navBar.createButtons(pathArray)

            contentLoader.source = "FinalMusicSelectionPage.qml"
        }
        onHandleLoader: {
            pathArray.pop()
            navBar.createButtons(pathArray)

            contentLoader.source = "TopicContent.qml"
        }
        onHandleBack: {
            topicPage.handlerLoader("HomePage.qml", 0)
        }
    }
}
