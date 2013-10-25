import QtQuick 2.0

Rectangle {
    id: music_album_selection
    width: 1280
    height: 591
    color: "transparent"
    signal handlerLoader(string name, int index)
    signal handleShowBaotai(variant cardPoint)
    signal handleShowSingerInfo(string starname)
    signal handleShowMvPreview(string mv)
    signal handleShowSecondFilter(string inputType)
    TestListModel {
        id: testModel
    }

    GridView {
        id: starList
        anchors.top: parent.top
        anchors.topMargin: 100

        width: parent.width
        height: 418
        cellWidth: 426
        cellHeight: 139
        opacity: 0

        flow: GridView.TopToBottom
        snapMode: GridView.SnapToRow
        cacheBuffer: 40;
        model: testModel
        delegate: Item {
            width: 426
            height: 139

            MouseArea {
                anchors.fill: cardImage;
                onClicked: {
                    var centerX = parent.x+parent.width/2;
                    var centerY = parent.y+parent.height/2;
                    music_album_selection.handleShowBaotai(Qt.point(centerX,centerY));
                }
            }

            Image {
                id: cardImage
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
                        music_album_selection.handleShowSingerInfo(parent.text);
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
                        music_album_selection.handleShowMvPreview("mv_id");
                    }
                }
            }
        }

        PropertyAnimation {
            id: animation
            target: starList
            property: "opacity"
            from: 0
            to: 1
            duration: 1500
        }

        Component.onCompleted: {
            animation.start()
        }
    }


    //下面的按钮条
    Rectangle {
        id: footer_div;
        width: 1280;height: 55;
        anchors.top: starList.bottom;
        anchors.topMargin: 0;
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
                music_album_selection.handleShowSecondFilter("quanbu");
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
                music_album_selection.handleShowSecondFilter("shoupin");
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
                music_album_selection.handleShowSecondFilter("shouxie");
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
                music_album_selection.handleShowSecondFilter("zishu");
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
            anchors.top: right.top;
            anchors.topMargin: 5;
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
                handlerLoader("HomePage.qml", 0)
            }
        }
    }
}
