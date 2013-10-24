import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

Rectangle {
    id: finalRankMusicSelection;
    width: 1280
    height: 591
    color: "transparent"

    signal handleLoader(string name, int index)
    signal handleShowBaotai(string title)
    signal handleShowSingerInfo(string starname)
    signal handleShowMvPreview(string mv)
    signal handleShowSecondFilter(string inputType)
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

    Row {
        Item {
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 60

            Image {
                x: 55
                y: 10
                width: 1158
                height: 489

                source: "images/finalTop/topbackground.png"
            }

            Image {
                id: highlight_img;
                x: 1075
                y: 39
                width: 146
                height: 136
                source: "images/finalTop/5.png"
                Behavior on y {
                    NumberAnimation { easing.amplitude: 5; easing.type: Easing.OutInBack; duration: 100 }
                }
            }

            PushButton {
                id: totalRank;
                x: 1075
                y: 39
                width: 146
                height: 136

                text: "总排行"
                colorText: "#FFFFFFFF"
                onClicked: highlight_img.y = totalRank.y;
            }

            PushButton {
                id: monthRank;
                x: 1075
                y: 173
                width: 146
                height: 136

                text: "月排行"
                colorText: "#FFFFFFFF"
                onClicked: highlight_img.y = monthRank.y;
            }

            PushButton {
                id: weekRank;
                x: 1075
                y: 308
                width: 146
                height: 136

                text: "周排行"
                colorText: "#FFFFFFFF"
                onClicked: highlight_img.y = weekRank.y;
            }

            TestListModel {
                id: testModel
            }

            GridView {
                id: musicList
                x: 55
                y: 54

                width: 1018
                height: 416
                cacheBuffer: 40

                cellWidth: 505
                cellHeight: 65

                flow: GridView.TopToBottom
                snapMode: GridView.SnapToRow

                clip: true

                model: testModel
                delegate: Item {
                    width: 579
                    height: 57

//                    Rectangle {
//                        width: 791
//                        height: 57

//                        color: index % 2?"#FF0000":"#00FF00"
//                    }
                    MouseArea {
                        anchors.fill: parent;
                        onClicked: {
                            finalRankMusicSelection.handleShowBaotai(titleId.text);
                        }
                    }
                    Text {
                        id: numberId
                        anchors.left: parent.left
//                        anchors.leftMargin: 40
                        anchors.top: parent.top
                        anchors.topMargin: 20
                        width: 60

                        text: index+1
                        horizontalAlignment: Text.AlignHCenter
                        color: "#FFFFFFFF"
                        font.pixelSize: 18
                    }

                    Text {
                        id: titleId

                        anchors.left: numberId.right
                        anchors.leftMargin: 20
                        anchors.top: parent.top
                        anchors.topMargin: 20

                        text: name
                        color: "#FFFFFFFF"
                        font.pixelSize: 18
                    }

                    Text {
                        id: starId

                        anchors.left: parent.right
                        anchors.leftMargin: -362
                        anchors.top: parent.top
                        anchors.topMargin: 20

                        text: star
                        //55, 99, 152
                        color: "#FF376398"
                        font.pixelSize: 18
                    }

                    PushButton {
                        id: zhiding
                        width: 31
                        height: 31

                        anchors.left: parent.right
                        anchors.leftMargin: -192
                        anchors.top: parent.top
                        anchors.topMargin: 16

                        icon: "images/TopicCategorySubPage/5.png"
                    }

                    PushButton {
                        id: shoucang
                        width: 31
                        height: 31

                        anchors.left: parent.right
                        anchors.leftMargin: -128
                        anchors.top: parent.top
                        anchors.topMargin: 16

                        icon: "images/TopicCategorySubPage/6.png"
                    }
                }
            }//end gridview



            //下面的按钮条
            Rectangle {
                id: footer_div;
                width: 1280;height: 55;
                anchors.top: musicList.bottom;
                anchors.topMargin: -10;
                color: "transparent";
                property string selectedimg: "images/secondfilter_selected.png";
                property string unselectedimg: "images/secondfilter_unselected.png";

                PushButton {
                    id:quanbu;
                    property bool selected: false;
                    text: "全部";
                    colorText: "white";
                    width: 80; height: 40;
                    anchors.top: parent.top;
                    anchors.left: parent.left;
                    anchors.leftMargin: 90;
                    backgroundNormal: selected?footer_div.selectedimg:footer_div.unselectedimg;
                    onClicked: {
                        quanbu.selected = true;
                        shoupin.selected = false;
                        shouxie.selected = false;
                        zishu.selected = false;
                        finalRankMusicSelection.handleShowSecondFilter("quanbu");
                    }
                }
                PushButton {
                    id:shoupin;
                    property bool selected: false;
                    text: "首拼";
                    colorText: "white";
                    width: 80; height: 40;
                    anchors.top: parent.top;
                    anchors.left: quanbu.right;
                    anchors.leftMargin: 15;
                    backgroundNormal: selected?footer_div.selectedimg:footer_div.unselectedimg;
                    onClicked: {
                        quanbu.selected = false;
                        shoupin.selected = false;
                        shouxie.selected = false;
                        zishu.selected = false;
                        finalRankMusicSelection.handleShowSecondFilter("shoupin");
                    }
                }
                PushButton {
                    id:shouxie;
                    property bool selected: false;
                    text: "手写";
                    colorText: "white";
                    width: 80; height: 40;
                    anchors.top: parent.top;
                    anchors.left: shoupin.right;
                    anchors.leftMargin: 15;
                    backgroundNormal: selected?footer_div.selectedimg:footer_div.unselectedimg;
                    onClicked: {
                        quanbu.selected = false;
                        shoupin.selected = false;
                        shouxie.selected = false;
                        zishu.selected = false;
                        finalRankMusicSelection.handleShowSecondFilter("shouxie");
                    }
                }
                PushButton {
                    id:zishu;
                    property bool selected: false;
                    text: "字数";
                    colorText: "white";
                    width: 80; height: 40;
                    anchors.top: parent.top;
                    anchors.left: shouxie.right;
                    anchors.leftMargin: 15;
                    backgroundNormal: selected?footer_div.selectedimg:footer_div.unselectedimg;
                    onClicked: {
                        quanbu.selected = false;
                        shoupin.selected = false;
                        shouxie.selected = false;
                        zishu.selected = false;
                        finalRankMusicSelection.handleShowSecondFilter("zishu");
                    }
                }
                PushButton {
                    id:left;
                    width: 68; height: 36;
                    anchors.top: parent.top;
                    anchors.right: pageText.left;
                    anchors.rightMargin: 30;
                    backgroundNormal: "images/left.png";
                    onClicked: {
                    }
                }
                Text {
                    id: pageText
                    width: 100;
                    text: qsTr("10/100")
                    color: "white";
                    font.pixelSize: 18
                    verticalAlignment: Text.AlignVCenter;
                    horizontalAlignment: Text.AlignHCenter;
                    anchors.right: right.left;
                    anchors.rightMargin: 30;
                    anchors.top: parent.top;
                    anchors.topMargin:  5;
                }
                PushButton {
                    id:right;
                    width: 68; height: 36;
                    anchors.top: parent.top;
                    anchors.right: back.left;
                    anchors.rightMargin: 80;
                    backgroundNormal: "images/right.png";
                    onClicked: {
                    }
                }
                PushButton {
                    id:back;
                    width: 100; height: 44;
                    anchors.top: parent.top;
                    anchors.right: parent.right;
                    anchors.rightMargin: 70;
                    backgroundNormal: "images/back.png";
                    onClicked: {
                        finalRankMusicSelection.handleLoader("RankSelectionPage.qml", 0)
                    }
                }
            }

        }//end item
    }//end row


}
