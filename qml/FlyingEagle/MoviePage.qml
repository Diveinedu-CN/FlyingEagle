import QtQuick 2.0

Rectangle {
    id: moviePage

    width: 1280
    height: 720

    signal movieClicked();

    Image {
        x: 55
        y: 28
        source: "images/movieBg.png"
    }

    Image {
        x: 77
        y: 49
        source: "images/movieFlash.png"

        MouseArea {
            anchors.fill: parent
            onClicked: {

            }
        }
    }

    PushButton {
        x: 316
        y: 467
        width: 136
        height: 51
        backgroundNormal: "images/movieButton.png"
        text: "立即播放"
        colorText: "#ffffff"
    }

    PushButton {
        x: 539
        y: 467
        width: 136
        height: 51
        backgroundNormal: "images/movieButton.png"
        text: "加入已选"
        colorText: "#ffffff"
    }

    FoldMenuList {
        anchors.right: parent.right
        anchors.rightMargin: 100
        anchors.top: parent.top
        anchors.topMargin: 100
    }

    PushButton {
        id:mv_preview_close;
        x: 1179
        y: 13
        width: 40;height: 40;
        backgroundNormal: "images/del.png";
        colorText: "#ffffff"
        onClicked: {
            moviePage.movieClicked()
        }
    }
}
