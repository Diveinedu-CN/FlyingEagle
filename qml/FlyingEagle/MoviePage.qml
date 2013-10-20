import QtQuick 2.0

Rectangle {
    id: moviePage

    width: 1280
    height: 720

    Image {
        x: 55
        y: 28
        source: "images/movieBg.png"
    }

    Image {
        x: 77
        y: 49
        source: "images/movieFlash.png"
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

    TestList {
        anchors.right: parent.right
    }
}
