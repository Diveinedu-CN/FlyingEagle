import QtQuick 2.0

Rectangle {
    anchors.fill: parent
    //anchors.bottomMargin: -25
    color: "transparent"

    signal handlerLoader(string name, int index)

    Rectangle {
        id: rectangle1
        x: 191
        y: 68
        width: 274
        height: 453
        color: "transparent"

        PushButton {
            id: pushbutton1
            x: 26
            y: 15
            width: 230
            height: 206
            backgroundNormal: "images/lang.png"

            onClicked: {
                handlerLoader("LangSelectionPage.qml", 0)
            }
        }

        PushButton {
            id: pushbutton2
            x: 18
            y: 229
            width: 243
            height: 212
            backgroundNormal: "images/fav.png"

            onClicked: {
                handlerLoader("FavoritePage.qml", 1)
            }
        }
    }

    Rectangle {
        id: rectangle2
        x: 478
        y: 68
        width: 298
        height: 453
        color: "transparent"

        PushButton {
            id: pushbutton3
            x: 9
            y: 82
            width: 281
            height: 322
            backgroundNormal: "images/star.png"

            onClicked: {
                handlerLoader("StarSelectionPage.qml", 2)
            }
        }
    }

    Rectangle {
        id: rectangle3
        x: 793
        y: 67
        width: 357
        height: 454
        color: "transparent"

        PushButton {
            id: pushbutton4
            x: 8
            y: 8
            width: 119
            height: 169
            backgroundNormal: "images/title.png"

            onClicked: {
                handlerLoader("TopicSelectionPage.qml", 3)
            }
        }

        PushButton {
            id: pushbutton5
            x: 8
            y: 183
            width: 119
            height: 194
            backgroundNormal: "images/top.png"

            onClicked: {
                handlerLoader("RankSelectionPage.qml", 4)
            }
        }

        PushButton {
            id: pushbutton6
            x: 148
            y: 8
            width: 201
            height: 173
            backgroundNormal: "images/song.png"

            onClicked: {
                handlerLoader("MusicSelectionPage.qml", 5)
            }
        }

        PushButton {
            id: pushbutton7
            x: 148
            y: 202
            width: 201
            height: 175
            backgroundNormal: "images/newsong.png"

            onClicked: {
                handlerLoader("NewMusicSelectionPage.qml", 6)
            }
        }
    }
}
