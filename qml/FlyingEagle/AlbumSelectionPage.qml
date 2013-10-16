import QtQuick 2.0

Rectangle {
    id: container

    width: 1280
    height: 591
    color: "transparent"

    signal clicked(int index, int type)

    TestModel2 {
        id: testModel2
    }

    TestListModel {
        id: testModel
    }

    GridView {
        id: musicList
        x: 106
        y: 79

        width: 1095
        height: 444

        cellWidth: 182
        cellHeight: 207

        flow: GridView.TopToBottom
        snapMode: GridView.SnapToRow

        clip: true

        model: testModel
        delegate: Item {
            width: 182
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

                source: "images/starBg.png"
            }

            Text {
                id: starName
                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.top: parent.top
                anchors.topMargin: 10

                text: star
                color: "#FFFFFFFF"
                font.pixelSize: 30
                font.bold: true
            }
        }
    }

    PushButton {
        id: leftButton
        x: 693
        y: 495
        width: 68
        height: 36

        anchors.top: musicList.bottom
        anchors.topMargin: -28

        icon: "images/left.png"

        onClicked: {
            //左移
            container.clicked(0, 1)
        }
    }

    Text {
        id: pageLabel
        x: 775
        y: 502
        width: 128
        height: 22

        anchors.top: musicList.bottom
        anchors.topMargin: -21

        text: "10/100"
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

        anchors.top: musicList.bottom
        anchors.topMargin: -28

        icon: "images/right.png"

        onClicked: {
            //右移
            container.clicked(1, 1)
        }
    }

    PushButton {
        x: 1101
        y: 494

        width: 100
        height: 44

        icon: "images/back.png"

        onClicked: {
            onClicked: {
                //返回
                container.clicked(2, 1)
            }
        }
    }
}
