import QtQuick 2.0

Rectangle {
    id: searchResult;
    width: 1280
    height: 591
    color: "transparent"

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
            id: navBar
            anchors.left: navDiangeImage.right
            anchors.leftMargin: 4
            anchors.verticalCenter: navDiangeImage.verticalCenter

            Component.onCompleted: {
                navBar.createButtons(new Array("搜索"))
            }
        }
    }

    TestListModel {
        id: testModel
    }

    GridView {
        id: starList
        anchors.top: tabbarId.bottom
        anchors.topMargin: 80
        opacity: 0

        width: parent.width
        height: 418
        cellWidth: 426
        cellHeight: 139

        flow: GridView.TopToBottom
        snapMode: GridView.SnapToRow
        cacheBuffer: 40;
        model: testModel
        delegate: Item {
            width: 426
            height: 139

            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    var centerX = parent.x+parent.width/2;
                    var centerY = parent.y+parent.height/2;
                    searchResult.handleShowBaotai(Qt.point(centerX,centerY));
                }
            }

            Image {
                id: cardImage
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.top: parent.top
                anchors.topMargin: 10
                source: "images/gequ.png"
            }

            Text {
                id: musicTitle
                anchors.left: cardImage.right
                anchors.leftMargin: 10

                anchors.horizontalCenter: cardImage.horizontalCenter

                text: number
                color: "#F922D8"
                font.pixelSize: 30
                font.bold: true
            }

            Text {
                id: star
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.bottom: musicTitle.bottom
//                anchors.horizontalCenter: cardImage.horizontalCenter

                text: name
                color: "#F922D8"
                font.pixelSize: 24
//                font.bold: true

                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        searchResult.handleShowSingerInfo(parent.text);
                    }
                }
            }

            Text {
                anchors.left: musicTitle.left
                anchors.top: musicTitle.bottom
                anchors.topMargin: 6

                text: name
                color: "#FFFFFFFF"
                font.pixelSize: 26

            }

//            Image {
//                id:mv_img;
//                width: 95; height:95;
//                anchors.top: parent.top
//                anchors.right: parent.right
//                anchors.topMargin: 15;
//                anchors.rightMargin: 55;
//                MouseArea {
//                    anchors.fill: parent;
//                    onClicked: {
//                        searchResult.handleShowMvPreview("mv_id");
//                    }
//                }
//            }
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
            anchors.top: right.top
            anchors.topMargin: 5
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
