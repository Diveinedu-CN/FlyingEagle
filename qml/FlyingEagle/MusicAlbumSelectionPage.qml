import QtQuick 2.0

Rectangle {
    width: 1280
    height: 591
    color: "transparent"

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

        flow: GridView.TopToBottom
        snapMode: GridView.SnapToRow

        model: testModel
        delegate: Item {
            width: 426
            height: 139

            Image {
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
            }

            Image {

            }
        }
    }
}
