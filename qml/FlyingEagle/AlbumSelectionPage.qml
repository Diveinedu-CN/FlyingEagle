import QtQuick 2.0

Rectangle {
    id: container

    width: 1280
    height: 591
    color: "transparent"

    signal clicked(int index, int type)
    signal handleShowSecondFilter(string inputType)
    TestModel2 {
        id: testModel2
    }

    TestListModel {
        id: testModel
    }

    GridView {
        id: musicList
        x: 12
        y: 89
        opacity: 0

        width: parent.width-40
        height: 444

        cellWidth: 210
        cellHeight: 207

        flow: GridView.TopToBottom
        snapMode: GridView.SnapToRow

        clip: true
        cacheBuffer: 40;
        model: testModel
        delegate: Item {
            width: 210
            height: 207

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    musicList.currentIndex = index
                    //type = 0表示选中了GridView中的一个Item
                    container.clicked(index, 0)
                }
            }

            Image {
                width: 182
                height: 207
                anchors.horizontalCenter: parent.horizontalCenter

                source: "images/starBg.png"
            }

            Text {
                id: starName
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 18

                text: star
                color: "#FFFFFFFF"
                font.pixelSize: 26
            }
        }

        PropertyAnimation {
            id: animation
            target: musicList
            property: "opacity"
            from: 0
            to: 1
            duration: 1500
        }

        Component.onCompleted: {
            animation.start()
        }
    }

    PushButton {
        id: leftButton
        x: 693
        y: 495
        width: 68
        height: 36

        anchors.top: backButton.top
        anchors.topMargin: 0
        anchors.right: pageLabel.left;
        anchors.rightMargin: 15
        backgroundNormal: "images/left.png"

        onClicked: {
            var nextPageIndex = (musicList.currentIndex/7)*7-12;
            if(nextPageIndex<0)
            {
                return;
            }
            musicList.currentIndex = nextPageIndex;
//            musicList.positionViewAtIndex(musicList.currentIndex, GridView.Beginning);
        }
    }

    Text {
        id: pageLabel
        x: 775
        y: 502
        width: 128
        height: 22

        anchors.top: rightButton.top
        anchors.topMargin: 5
        anchors.right: rightButton.left
        anchors.rightMargin: 15;
        text: (musicList.currentIndex+1)+"/"+musicList.count;
        horizontalAlignment: Text.AlignHCenter
        color: "#FFFFFFFF"
        font.pixelSize: 18
    }

    PushButton {
        id: rightButton
        x: 921
        y: 495
        width: 68
        height: 36

        anchors.top: backButton.top
        anchors.topMargin: 0
        anchors.right: backButton.left
        anchors.rightMargin: 80;
        backgroundNormal: "images/right.png"

        onClicked: {
            var nextPageIndex = (musicList.currentIndex/7)*7+12;
            if(nextPageIndex>=musicList.count)
            {
                return;
            }
            musicList.currentIndex = nextPageIndex;
//            musicList.positionViewAtIndex(musicList.currentIndex, GridView.Beginning);
        }
    }

    PushButton {
        id: backButton
        x: 1110
        y: 518

        width: 100
        height: 44
        anchors.right: parent.right;
        anchors.rightMargin: 70;
        backgroundNormal: "images/back.png"

        onClicked: {
            handlerLoader("HomePage.qml", 0)
        }
    }

    //下面的二次筛选按钮条
    Rectangle {
        id: footer_div;
        width: 1280;height: 55;
        anchors.top: backButton.top;
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
                container.handleShowSecondFilter("quanbu");
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
                container.handleShowSecondFilter("shoupin");
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
                container.handleShowSecondFilter("shouxie");
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
                container.handleShowSecondFilter("zishu");
            }
        }
    }
}
