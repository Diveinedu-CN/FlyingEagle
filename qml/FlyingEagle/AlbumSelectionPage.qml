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
            //左移
            musicList.moveCurrentIndexLeft()
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

        anchors.top: backButton.top
        anchors.topMargin: 0
        anchors.right: backButton.left
        anchors.rightMargin: 80;
        backgroundNormal: "images/right.png"

        onClicked: {
            //右移
            musicList.moveCurrentIndexRight()
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
}
