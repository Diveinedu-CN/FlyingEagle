import QtQuick 2.0

Rectangle {
    id: udiskAddPage

    width: 1090
    height: 586
    signal udiskCloseClicked();
    color: "transparent"
    MouseArea {
        anchors.fill: parent;
        onClicked: {

        }
    }

    Rectangle {
        id:udiskAddList
        anchors.fill: parent;
        color: "transparent"
        Image {
            id: udiskAddListBg
            anchors.fill: parent;
            source: "images/udiskAddbg.png"
        }
        Image {
            id: selectedType;
            x: 65
            y: 456
            width: 150; height: 60;
            source: "images/udiskAddxuanzhong.png";
            Behavior on y {
                NumberAnimation { easing.amplitude: 5; easing.type: Easing.OutInBack; duration: 100 }
            }
        }
        Column {
            id: mediaTypeColumn;
            x: 61
            y: 36
            spacing: 15;
            Rectangle {
                id: shipin;
                width: 158;
                height: 158;
                color: "transparent"
                MouseArea {
                    anchors.fill: parent;
                    onClicked: selectedType.y = 114;
                }

                Image {
                    id: shipinimg;
                    width: 100;
                    height: 100;
                    anchors.top: parent.top;
                    anchors.left: parent.left;
                    anchors.topMargin: 20;
                    anchors.leftMargin: 30;
                    source: "images/udiskAddshipin.png";
                }
                Text {
                    id: shipinText;
                    anchors.top: shipinimg.bottom;
                    anchors.topMargin: 10;
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("视频")
                    font.pixelSize: 24
                    color: "white"
                }
            }
            Rectangle {
                id: yinyue;
                width: 158;
                height: 158;
                color: "transparent"
                MouseArea {
                    anchors.fill: parent;
                    onClicked: selectedType.y = 284;
                }
                Image {
                    id: yinyueimg;
                    width: 100;
                    height: 100;
                    anchors.top: parent.top;
                    anchors.left: parent.left;
                    anchors.topMargin: 20;
                    anchors.leftMargin: 30;
                    source: "images/udiskAddyinyue.png";
                }
                Text {
                    id: yinyueText
                    anchors.top: yinyueimg.bottom;
                    anchors.topMargin: 10;
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("音乐")
                    font.pixelSize: 24
                    color: "white"
                }
            }
            Rectangle {
                id: tupian;
                width: 158;
                height: 158;
                color: "transparent"
                MouseArea {
                    anchors.fill: parent;
                    onClicked: selectedType.y = 456;
                }
                Image {
                    id: tupianimg;
                    width: 100;
                    height: 100;
                    anchors.top: parent.top;
                    anchors.left: parent.left;
                    anchors.topMargin: 20;
                    anchors.leftMargin: 30;
                    source: "images/udiskAddtupian.png";
                }
                Text {
                    id: tupianText
                    anchors.top: tupianimg.bottom;
                    anchors.topMargin: 10;
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("图片")
                    font.pixelSize: 24
                    color: "white"
                }
            }

        }

        ListModel {
            id: meidaListModel;

            ListElement {
                medianame: "Apple"
                mediaId: 1
            }
            ListElement {
                medianame: "Orange"
                mediaId: 2
            }
            ListElement {
                medianame: "Banana"
                mediaId: 3
            }
            ListElement {
                medianame: "Apple"
                mediaId: 1
            }
            ListElement {
                medianame: "Orange"
                mediaId: 2
            }
            ListElement {
                medianame: "Banana"
                mediaId: 3
            }
            ListElement {
                medianame: "Apple"
                mediaId: 1
            }
            ListElement {
                medianame: "Orange"
                mediaId: 2
            }
            ListElement {
                medianame: "Banana"
                mediaId: 3
            }
            ListElement {
                medianame: "Apple"
                mediaId: 1
            }
            ListElement {
                medianame: "Orange"
                mediaId: 2
            }
            ListElement {
                medianame: "Banana"
                mediaId: 3
            }
        }
        GridView {
            id: mediaList
            x: 55
            y: 54
            anchors.top: parent.top;
            anchors.right: parent.right;
            anchors.topMargin: 40;
            anchors.rightMargin: 50;
            width: 700
            height: 400
            cacheBuffer: 320

            cellWidth: 400
            cellHeight: 55

            flow: GridView.TopToBottom
            snapMode: GridView.SnapToRow

            clip: true

            model: meidaListModel;
            delegate: Item {
                Rectangle {
                    width: 400;
                    height: 55;
                    color: "transparent"
                    anchors.top: parent.top;
                    anchors.topMargin: 10;
                    PushButton {
                        id: bianhao
                        width: 40
                        height: 40
                        anchors.top: parent.top;
                        anchors.topMargin: 5
                        icon: "images/udiskAddbianhao.png"
                        text: mediaId
                        colorText: "white"
                    }
                    Text {
                        id: mediaFilename
                        width: 40
                        height: 40
                        anchors.left: bianhao.right
                        anchors.leftMargin: 20;
                        anchors.top: parent.top;
                        anchors.topMargin: 12;
                        anchors.verticalCenter: parent.verticalCenter;
                        text: medianame
                        color: "white"
                        font.pixelSize: 18
                    }

                }
            }
        }//end GridView

        PushButton {
            id: leftButton
            x: 534
            y: 480
            width: 68
            height: 36
            anchors.top: parent.top;
            anchors.topMargin: 480
            backgroundNormal: "images/left.png"
        }
        Text {
            id: pageNO
            x: 634
            y: 480
            width: 80
            height: 36
            anchors.verticalCenter: leftButton.verticalCenter;
            text: "10/100"
            color: "white"
            font.pixelSize: 20
        }
        PushButton {
            id: rightButton
            x: 742
            y: 480
            width: 68
            height: 36
            anchors.top: parent.top;
            anchors.topMargin: 480
            backgroundNormal: "images/right.png"
        }
        PushButton {
            id: closeButton
            x: 1055
            y: -8
            width: 40
            height: 40
            anchors.top: parent.top;
            anchors.topMargin: -8
            backgroundNormal: "images/del.png"
            onClicked: {
                udiskAddPage.udiskCloseClicked();
            }
        }
    }


}
