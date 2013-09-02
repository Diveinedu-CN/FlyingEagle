import QtQuick 2.0

Rectangle {
    anchors.fill: parent
    //anchors.bottomMargin: -25
    color: "transparent"

    signal handlerLoader(string name, int index)

    Rectangle {
        id: rectangle1
        x: 100
        y: 20
        width: 194
        height: 633
        color: "transparent"

        PushButton {
            id: pushbutton1
            x: 0
            y: 0
            width: 194
            height: 234
            clip: false
            backgroundNormal: "images/lang.png"

            onClicked: {
                handlerLoader("LangSelectionPage.qml", 0)
            }
        }

        PushButton {
            id: pushbutton2
            x: 0
            y: 250
            width: 194
            height: 233
            backgroundNormal: "images/fav.png"

            onClicked: {
                handlerLoader("FavoritePage.qml", 1)
            }
        }

        Image {
            id: image1
            x: 0
            y: 452
            width: 194
            height: 180
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            rotation: 0
            source: "images/dy-fav.png"
        }
    }

    Rectangle {
        id: rectangle2
        x: 300
        y: 20
        width: 436
        height: 634
        color: "transparent"

        PushButton {
            id: pushbutton3
            x: 0
            y: 0
            width: parent.width
            height: 484
            backgroundNormal: "images/star.png"

            onClicked: {
                handlerLoader("StarSelectionPage.qml", 2)
            }
        }

        Image {
            id: image2
            x: 0
            y: 433
            width: 436
            height: 201
            fillMode: Image.PreserveAspectFit
            source: "images/dy-star.png"
        }
    }

    Rectangle {
        id: rectangle3
        x: 744
        y: 20
        width: 420
        height: 634
        color: "transparent"

        PushButton {
            id: pushbutton4
            x: 0
            y: 49
            width: 141
            height: 187
            backgroundNormal: "images/title.png"

            onClicked: {
                handlerLoader("TopicSelectionPage.qml", 3)
            }
        }

        PushButton {
            id: pushbutton5
            x: 0
            y: 246
            width: 141
            height: 187
            backgroundNormal: "images/top.png"

            onClicked: {
                handlerLoader("RankSelectionPage.qml", 4)
            }
        }

        PushButton {
            id: pushbutton6
            x: 145
            y: 0
            width: 272
            height: 236
            backgroundNormal: "images/song.png"

            onClicked: {
                handlerLoader("MusicSelectionPage.qml", 5)
            }
        }

        PushButton {
            id: pushbutton7
            x: 145
            y: 246
            width: 272
            height: 236
            backgroundNormal: "images/newsong.png"

            onClicked: {
                handlerLoader("NewMusicSelectionPage.qml", 6)
            }
        }

        Image {
            id: image3
            x: 0
            y: 433
            width: 141
            height: 201
            fillMode: Image.PreserveAspectFit
            source: "images/dy-top.png"
        }

        Image {
            id: image4
            x: 145
            y: 457
            width: 272
            height: 177
            fillMode: Image.PreserveAspectFit
            source: "images/dy-new.png"
        }
    }
}
