/*
 *语种选择界面，根据语种选择歌曲
**/
import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import "componentCreation.js" as ComponentCreation

Rectangle {
    id: lang_music_selection;
    width: 1280
    height: 591
    color: "transparent"

    property var langArray: new Array("全部歌星", "热门", "港台男", "港台女", "大陆男", "大陆女", "日韩", "欧美", "网络", "组合", "其他")

    signal handlerLoader(string name, int index)
    signal handleShowBaotai(string title)
    signal handleShowSingerInfo(string starname)
    signal handleShowMvPreview(string mv)
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
            anchors.left: parent.left
            anchors.top: navDiangeImage.bottom
            source: "images/daohangtiao.png"
        }

        //创建语言选择按钮
        Component.onCompleted: {
            var preButton = null;
            for(var i=0; i<langArray.length; i++) {
                var button = ComponentCreation.createTabButton(tabBar, langArray[i]);
                if (preButton == null) {
                    button.anchors.left = tabbarId.left;
                    button.anchors.leftMargin = 20;
                } else {
                    button.anchors.left = preButton.right;
                    button.anchors.leftMargin = 10;
                }
                preButton = button;
            }
        }
    }

    TestListModel {
        id: testModel
    }

    GridView {
        id: starList
        anchors.top: tabbarId.bottom
        anchors.topMargin: 100

        width: parent.width
        height: 418
        cellWidth: 426
        cellHeight: 139

        flow: GridView.TopToBottom
        snapMode: GridView.SnapToRow

        model: testModel
        delegate: Item {
            width: 426
            height: 139

            Image {
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.top: parent.top
                source: "images/musicBg.png"
            }

            Text {
                id: musicTitle
                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.top: parent.top
                anchors.topMargin: 10

                text: name
                color: "#FFFFFFFF"
                font.pixelSize: 30
                font.bold: true
                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        lang_music_selection.handleShowBaotai(parent.text);
                    }
                }
            }

            Text {
                anchors.left: musicTitle.left
                anchors.top: musicTitle.bottom
                anchors.topMargin: 10

                text: number
                color: "#FFFFFFFF"
            }

            Text {
                anchors.left: musicTitle.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20

                text: star
                color: "#FFFFFFFF"
                font.pixelSize: 26
                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        lang_music_selection.handleShowSingerInfo(parent.text);
                    }
                }
            }

            Image {
                id:mv_img;
                width: 95; height:95;
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 15;
                anchors.rightMargin: 55;
                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        lang_music_selection.handleShowMvPreview("mv_id");
                    }
                }
            }
        }
    }
}
