import QtQuick 2.0

Rectangle {
    id: moviePage

    width: 1280
    height: 720

    signal movieClicked();

    Image {
        x: 69
        y: 72
        source: "images/movieBg.png"
    }

    Image {
        x: 92
        y: 93
        source: "images/movieFlash.png"

        MouseArea {
            x: 0
            y: 44
            anchors.rightMargin: 0
            anchors.bottomMargin: -44
            anchors.leftMargin: 0
            anchors.topMargin: 44
            anchors.fill: parent
            onClicked: {

            }
        }
    }

    PushButton {
        x: 316
        y: 504
        width: 136
        height: 51
        backgroundNormal: "images/movieButton.png"
        text: "立即播放"
        colorText: "#ffffff"
    }

    PushButton {
        x: 537
        y: 504
        width: 136
        height: 51
        backgroundNormal: "images/movieButton.png"
        text: "加入已选"
        colorText: "#ffffff"
    }

    FoldMenuList {
        x: 920
        y: 139
        anchors.right: parent.right
        anchors.rightMargin: 100
        anchors.top: parent.top
        anchors.topMargin: 139
    }

    PushButton {
        id:mv_preview_close;
        x: 1192
        y: 49
        width: 40;height: 40;
        backgroundNormal: "images/del.png";
        colorText: "#ffffff"
        onClicked: {
            moviePage.movieClicked()
        }
    }
}
