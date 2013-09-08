/*
 *最终的歌曲选择界面
**/

import QtQuick 2.0
import QtQuick.Controls 1.0

Rectangle {
    width: 1280
    height: 591
    color: "green"

    signal handlerLoader(string name, int index)

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

    Row {
        Item {
            id: leftHalf
            width: 400
            height: 400

            Image {
                id: waike
                width: 300
                height: 250
                anchors.left: parent.left
                anchors.leftMargin: 100
                anchors.top: parent.top
                anchors.topMargin: 60

                source: "images/waike.jpg"
            }

            Image {
                property real translateY: -80

                id: guangpan
                width: 300
                height: 300
                anchors.left: waike.left
                anchors.top: waike.bottom
                anchors.topMargin: -80

                transform: Translate {
                    y: guangpan.translateY
                }

                z: waike.z - 1

                source: "images/disk.png"
            }

            SequentialAnimation {
                id: animation

                NumberAnimation {
                    target: guangpan;
                    property: "translateY";
                    to: -120
                    duration: 1000;
                    easing.type: Easing.InOutQuad
                }

                NumberAnimation {
                    target: guangpan;
                    property: "translateY";
                    to: -60
                    duration: 1000;
                    easing.type: Easing.InOutQuad
                }

                loops: Animation.Infinite
            }

            Component.onCompleted: {
                animation.start()
            }
        }

        Item {
            anchors.left: leftHalf.right
            anchors.top: leftHalf.top
            anchors.topMargin: 60

            TestListModel {
                id: testModel
            }

            GridView {
                id: musicList

                width: 600
                height: 400

                cellWidth: 600
                cellHeight: 39

                flow: GridView.TopToBottom
                snapMode: GridView.SnapToRow

                clip: true

                model: testModel
                delegate: Item {
                    width: 600
                    height: 39

                    Text {
                        id: numberId
                        anchors.left: parent.left
                        anchors.leftMargin: 40
                        anchors.top: parent.top
                        width: 40

                        text: index
                        color: "#FFFF0000"
                        font.pixelSize: 18
                    }

                    Text {
                        id: titleId

                        anchors.left: numberId.right
                        anchors.top: parent.top

                        text: number
                        color: "#FFFFFFFF"
                        font.pixelSize: 18
                    }

                    Text {
                        id: starId

                        anchors.right: zhiding.left
                        anchors.top: parent.top

                        text: star
                        color: "#FFFFFFFF"
                        font.pixelSize: 18
                    }

                    Button {
                        id: zhiding
                        width: 40
                        height: 40

                        anchors.right: shoucang.left
                        anchors.top: parent.top
                    }

                    Button {
                        id: shoucang
                        width: 40
                        height: 40

                        anchors.right: yulan.left
                        anchors.top: parent.top
                    }

                    Button {
                        id: yulan
                        width: 40
                        height: 40

                        anchors.right: parent.right
                        anchors.top: parent.top
                    }
                }
            }
        }
    }

    Button {
        x: 1000
        y: 500

        width: 60
        height: 40

        onClicked: {
            handlerLoader("TopicSelectionPage.qml", 0)
        }
    }
}
