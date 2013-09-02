/*
 *语种选择界面，根据语种选择歌曲
**/
import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

Rectangle {
    width: 1280
    height: 591
    color: "transparent"

    signal handlerLoader(string name, int index)

    Item {
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

        //Tab标签栏
        Image {
            id: tabBar
        }
    }
}
