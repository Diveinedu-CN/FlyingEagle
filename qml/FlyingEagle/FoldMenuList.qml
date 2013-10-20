import QtQuick 2.0

Item {
    id:main
    width: 260
    height: 460

    TestModel2 {
        id: testModel
    }

    ListView {
        anchors.fill: parent
        model: testModel
        spacing: 20
        cacheBuffer: 200 // in pixels
        clip: true

        delegate: Rectangle {
            property alias itemHeight: cell.height
            property bool unfold: false

            id: cell

            width: 260
            height: 32
            color: "transparent"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(!cell.unfold) {
                        cell.height = (subList.count + 1) * 50
                        arrowImage.source = "images/movieUp.png"
                    } else {
                        cell.height = 32
                        arrowImage.source = "images/movieDown.png"
                    }

                    cell.unfold = !cell.unfold
                }
            }

            Item {
                id: mainList

                anchors.top: cell.top
                anchors.left: cell.left
                width: 260
                height: 20

                Text {
                    anchors.left: parent.left
                    text: name
                    color: "white"
                    font.pixelSize: 18
                }

                Image {
                    id: arrowImage
                    anchors.left: parent.left
                    anchors.leftMargin: 200

                    source: cell.unfold ? "images/movieUp.png" : "images/movieDown.png"
                }
            }

            Column {
                anchors.top: mainList.bottom
                anchors.topMargin: 40
                spacing: 20

                Repeater {
                    id: repeater

                    model: cell.unfold ? subList : 0
                    delegate: Item {
                        width: 260
                        height: 32

                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            text: nick
                            color: "white"
                            font.pixelSize: 18
                        }

                        MouseArea {
                            anchors.fill: parent

                            onClicked: {
                                console.log(nick)
                            }
                        }
                    }
                }
            }
        }
    }
}
