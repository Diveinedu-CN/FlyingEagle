import QtQuick 2.0

Item {
    id:main
    width: 260
    height: 460

    TestModel2 {
        id: testModel
    }

    ListView {
        id: listView
        anchors.fill: parent
        spacing: 20
        cacheBuffer: 200 // in pixels
        clip: true

        model: testModel
        delegate: Rectangle {
            property alias itemHeight: cell.height
            property bool unfold: false

            id: cell

            width: 260
            height: 32
            color: "transparent"

            Image {
                anchors.fill: parent
                source: ((subList.count === 0) && (listView.currentIndex===index))?"images/movieSelected.png":""
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    listView.currentIndex = index
                    if(subList.count === 0) {
                        return
                    }

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
                    visible: subList.count?true:false

                    source: cell.unfold ? "images/movieUp.png" :"images/movieDown.png"
                }
            }

            Column {
                anchors.top: mainList.bottom
                anchors.topMargin: 40
                spacing: 20

                Repeater {
                    id: repeater
                    property int currentIndex: -1

                    model: cell.unfold ? subList : 0
                    delegate: Item {
                        width: 260
                        height: 32

                        Image {
                            source: "images/movieSelected.png"
                            visible: (repeater.currentIndex===index)?true:false
                        }

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
                                repeater.currentIndex = index
                            }
                        }
                    }
                }
            }
        }
    }
}
