import QtQuick 2.0

Rectangle {
    id: homepage
    ParallelAnimation {
        id: zAnimation
        running: true
        SequentialAnimation{
            loops: Animation.Infinite
            NumberAnimation { target: rectangle1; property: "zAngle"; to: +5; duration: 1000; easing.type: Easing.Linear  }
            NumberAnimation { target: rectangle1; property: "zAngle"; to: 0; duration: 1000; easing.type: Easing.Linear  }

        }
        SequentialAnimation{
            loops: Animation.Infinite
            NumberAnimation { target: rectangle2; property: "zAngle"; to: +5; duration: 1000; easing.type: Easing.Linear  }
            NumberAnimation { target: rectangle2; property: "zAngle"; to: 0; duration: 1000; easing.type: Easing.Linear  }

        }
        SequentialAnimation{
            loops: Animation.Infinite
            NumberAnimation { target: rectangle2; property: "xDelta"; to: -5; duration: 1000; easing.type: Easing.Linear  }
            NumberAnimation { target: rectangle2; property: "xDelta"; to: 0; duration: 1000; easing.type: Easing.Linear  }

        }
        SequentialAnimation{
            loops: Animation.Infinite
            NumberAnimation { target: rectangle3; property: "zAngle"; to: +4; duration: 1000; easing.type: Easing.Linear  }
            NumberAnimation { target: rectangle3; property: "zAngle"; to: 0; duration: 1000; easing.type: Easing.Linear  }

        }
    }

    function showShaders(bShow)
    {
        if(bShow) {
            shader1.visible = true
            shader2.visible = true
            shader3.visible = true
            shader4.visible = true
        } else {
            shader1.visible = false
            shader2.visible = false
            shader3.visible = false
            shader4.visible = false
        }
    }

    property int animationTime: 600
    property int animationAngle: 360
    property int scaleValue:5
    property var opacityValue: 0
    property int animationX: 400
    //放大动画, 选中的图片一边放大,一边翻转, 其它未选中图片分别向左右散开
    ParallelAnimation {
        id: langAnimation
        PropertyAnimation {
            targets: [pushbutton1, pushbutton2, pushbutton3, pushbutton4, pushbutton5, pushbutton6, pushbutton7]
            properties: "opacity"
            to: opacityValue
            duration: animationTime
        }
//        PropertyAnimation {
//            target: pushbutton1
//            properties: "angle"
//            easing.type: Easing.Linear
//            to:animationAngle
//            duration: animationTime
////            direction: RotationAnimation.Counterclockwise
//        }
        PropertyAnimation {
            target: pushbutton1
            properties: "scale"
            to: scaleValue
            duration: animationTime
        }
//        SequentialAnimation {
//            NumberAnimation {
//                target: pushbutton1
//                properties: "x"
//                to: -500
//                duration: animationTime/2
//            }
//            NumberAnimation {
//                target: pushbutton1
//                properties: "x"
//                to: 0
//                duration: animationTime/2
//            }
//        }
        NumberAnimation {
            target: pushbutton1
            properties: "x"
            to: 550
            duration: animationTime
        }

        SequentialAnimation {
            NumberAnimation {
                target: pushbutton1
                properties: "y"
                to: -520
                duration: animationTime/2
            }
            NumberAnimation {
                target: pushbutton1
                properties: "y"
                to: 220
                duration: animationTime/2
            }
        }

        PropertyAnimation {
            targets: [pushbutton2]
            properties: "y"
            easing.type: Easing.OutCubic
            to: animationX+600
            duration: animationTime
        }
        PropertyAnimation {
            target: pushbutton2
            properties: "angle"
            easing.type: Easing.InQuad
            to:-60
            duration: animationTime
//            direction: RotationAnimation.Counterclockwise
        }
        PropertyAnimation {
            targets: [pushbutton3, pushbutton4, pushbutton5, pushbutton6, pushbutton7]
            properties: "x"
            easing.type: Easing.OutCubic
            to: animationX+600
            duration: animationTime
        }
        PropertyAnimation {
            targets: [pushbutton3, pushbutton4, pushbutton5, pushbutton6, pushbutton7]
            properties: "angle"
            easing.type: Easing.OutCubic
            to:60
            duration: animationTime
//            direction: RotationAnimation.Counterclockwise
        }

        onStopped: {
            console.log("LangSelectionPage.qml")
            handlerLoader("LangSelectionPage.qml", 0)
        }
    }

    ParallelAnimation {
        id: favoriteAnimation
        PropertyAnimation {
            targets: [pushbutton1, pushbutton2, pushbutton3, pushbutton4, pushbutton5, pushbutton6, pushbutton7]
            properties: "opacity"
            to: opacityValue
            duration: animationTime
        }
//        PropertyAnimation {
//            target: pushbutton2
//            properties: "angle"
//            easing.type: Easing.InQuad
//            to:animationAngle
//            duration: animationTime
////            direction: RotationAnimation.Counterclockwise
//        }
        PropertyAnimation {
            target: pushbutton2
            properties: "scale"
            to: scaleValue
            duration: animationTime
        }
        SequentialAnimation {
            NumberAnimation {
                target: pushbutton2
                properties: "y"
                to: 1120
                duration: animationTime/2
            }
            NumberAnimation {
                target: pushbutton2
                properties: "y"
                to: 220
                duration: animationTime/2
            }
        }
        NumberAnimation {
            target: pushbutton2
            properties: "x"
            to: 550
            duration: animationTime
        }
        PropertyAnimation {
            targets: [pushbutton1]
            properties: "y"
            easing.type: Easing.OutCubic
            to: -animationX
            duration: animationTime
        }
        PropertyAnimation {
            targets: [pushbutton3, pushbutton4, pushbutton5, pushbutton6, pushbutton7]
            properties: "x"
            easing.type: Easing.OutCubic
            to: animationX+600
            duration: animationTime
        }
        PropertyAnimation {
            targets: [pushbutton3, pushbutton4, pushbutton5, pushbutton6, pushbutton7]
            properties: "angle"
            easing.type: Easing.OutCubic
            to:60
            duration: animationTime
//            direction: RotationAnimation.Counterclockwise
        }

        onStopped: {
            console.log("FavoritePage.qml")
            handlerLoader("FavoritePage.qml", 0)
        }
    }

    ParallelAnimation {
        id: starAnimation
        PropertyAnimation {
            targets: [pushbutton1, pushbutton2, pushbutton3, pushbutton4, pushbutton5, pushbutton6, pushbutton7]
            properties: "opacity"
            to: opacityValue
            duration: animationTime
        }
//        PropertyAnimation {
//            target: pushbutton3
//            properties: "angle"
//            easing.type: Easing.Linear
//            to:animationAngle
//            duration: animationTime
////            direction: RotationAnimation.Counterclockwise
//        }
        SequentialAnimation {
            NumberAnimation {
                target: pushbutton3
                properties: "x"
                to: -1000
                duration: animationTime/2
            }
            NumberAnimation {
                target: pushbutton3
                properties: "x"
                to: 0
                duration: animationTime/2
            }
        }
        PropertyAnimation {
            target: pushbutton3
            properties: "scale"
            to: scaleValue
            duration: animationTime
        }
        PropertyAnimation {
            targets: [pushbutton1, pushbutton2]
            properties: "x"
            easing.type: Easing.InQuad
            to: -animationX
            duration: animationTime
        }
        PropertyAnimation {
            targets: [pushbutton4, pushbutton5, pushbutton6, pushbutton7]
            properties: "x"
            easing.type: Easing.InQuad
            to: animationX
            duration: animationTime
        }

        onStopped: {
            console.log("StarSelectionPage.qml")
            handlerLoader("StarSelectionPage.qml", 0)
        }
    }

    ParallelAnimation {
        id: topicAnimation
        PropertyAnimation {
            targets: [pushbutton1, pushbutton2, pushbutton3, pushbutton4, pushbutton5, pushbutton6, pushbutton7]
            properties: "opacity"
            to: opacityValue
            duration: animationTime
        }
//        PropertyAnimation {
//            target: pushbutton4
//            properties: "angle"
//            easing.type: Easing.InQuad
//            to:animationAngle
//            duration: animationTime
////            direction: RotationAnimation.Counterclockwise
//        }
        PropertyAnimation {
            target: pushbutton4
            properties: "scale"
            to: scaleValue
            duration: animationTime
        }
        SequentialAnimation {
            NumberAnimation {
                target: pushbutton4
                properties: "y"
                to: -520
                duration: animationTime/2
            }
            NumberAnimation {
                target: pushbutton4
                properties: "y"
                to: 220
                duration: animationTime/2
            }
        }
        NumberAnimation {
            target: pushbutton4
            properties: "x"
            to: 150
            duration: animationTime
        }
        PropertyAnimation {
            targets: [pushbutton1, pushbutton2, pushbutton3]
            properties: "x"
            easing.type: Easing.OutCubic
            to: -animationX-800
            duration: animationTime
        }
        PropertyAnimation {
            targets: [pushbutton5, pushbutton7]
            properties: "y"
            easing.type: Easing.OutCubic
            to: animationX+800
            duration: animationTime
        }
        PropertyAnimation {
            targets: [pushbutton6, pushbutton7]
            properties: "x"
            easing.type: Easing.OutCubic
            to: animationX+800
            duration: animationTime
        }

        onStopped: {
            console.log("TopicSelectionPage.qml")
            handlerLoader("TopicSelectionPage.qml", 0)
        }
    }

    ParallelAnimation {
        id: rankAnimation
        PropertyAnimation {
            targets: [pushbutton1, pushbutton2, pushbutton3, pushbutton4, pushbutton5, pushbutton6, pushbutton7]
            properties: "opacity"
            to: opacityValue
            duration: animationTime
        }
        PropertyAnimation {
            target: pushbutton5
            properties: "angle"
            easing.type: Easing.InQuad
            to:animationAngle
            duration: animationTime
//            direction: RotationAnimation.Counterclockwise
        }
        PropertyAnimation {
            target: pushbutton5
            properties: "scale"
            to: scaleValue
            duration: animationTime
        }
        SequentialAnimation {
            NumberAnimation {
                target: pushbutton5
                properties: "y"
                to: -820
                duration: animationTime/2
            }
            NumberAnimation {
                target: pushbutton5
                properties: "y"
                to: 220
                duration: animationTime/2
            }
        }
        NumberAnimation {
            target: pushbutton5
            properties: "x"
            to: 250
            duration: animationTime
        }
        PropertyAnimation {
            targets: [pushbutton1, pushbutton2, pushbutton3]
            properties: "x"
            easing.type: Easing.OutCubic
            to: -animationX-800
            duration: animationTime
        }
        PropertyAnimation {
            targets: [pushbutton4, pushbutton6]
            properties: "y"
            easing.type: Easing.OutCubic
            to: -animationX-800
            duration: animationTime
        }
        PropertyAnimation {
            targets: [pushbutton6, pushbutton7]
            properties: "x"
            easing.type: Easing.OutCubic
            to: animationX+800
            duration: animationTime
        }

        onStopped: {
            console.log("RankSelectionPage.qml")
            handlerLoader("RankSelectionPage.qml", 0)
        }
    }

    ParallelAnimation {
        id: musicAnimation
        PropertyAnimation {
            targets: [pushbutton1, pushbutton2, pushbutton3, pushbutton4, pushbutton5, pushbutton6, pushbutton7]
            properties: "opacity"
            to: opacityValue
            duration: animationTime
        }
//        PropertyAnimation {
//            target: pushbutton6
//            properties: "angle"
//            easing.type: Easing.InQuad
//            to:animationAngle
//            duration: animationTime
////            direction: RotationAnimation.Counterclockwise
//        }
        PropertyAnimation {
            target: pushbutton6
            properties: "scale"
            to: scaleValue
            duration: animationTime
        }
        SequentialAnimation {
            NumberAnimation {
                target: pushbutton6
                properties: "y"
                to: -520
                duration: animationTime/2
            }
            NumberAnimation {
                target: pushbutton6
                properties: "y"
                to: 220
                duration: animationTime/2
            }
        }
        NumberAnimation {
            target: pushbutton6
            properties: "x"
            to: 250
            duration: animationTime
        }
        PropertyAnimation {
            targets: [pushbutton1, pushbutton2, pushbutton3, pushbutton4, pushbutton5]
            properties: "x"
            easing.type: Easing.OutCubic
            to: -animationX-800
            duration: animationTime
        }
        PropertyAnimation {
            targets: [pushbutton5, pushbutton7]
            properties: "y"
            easing.type: Easing.OutCubic
            to: animationX+800
            duration: animationTime
        }

        onStopped: {
            console.log("MusicSelectionPage.qml")
            handlerLoader("MusicSelectionPage.qml", 0)
        }
    }

    ParallelAnimation {
        id: newMusicAnimation
        PropertyAnimation {
            targets: [pushbutton1, pushbutton2, pushbutton3, pushbutton4, pushbutton5, pushbutton6, pushbutton7]
            properties: "opacity"
            to: opacityValue
            duration: animationTime
        }
//        PropertyAnimation {
//            target: pushbutton7
//            properties: "angle"
//            easing.type: Easing.InCubic
//            to:animationAngle
//            duration: animationTime
////            direction: RotationAnimation.Counterclockwise
//        }
        PropertyAnimation {
            target: pushbutton7
            properties: "scale"
            to: scaleValue
            duration: animationTime
        }
        SequentialAnimation {
            NumberAnimation {
                target: pushbutton7
                properties: "y"
                to: 1020
                duration: animationTime/2
            }
            NumberAnimation {
                target: pushbutton7
                properties: "y"
                to: 220
                duration: animationTime/2
            }
        }
        NumberAnimation {
            target: pushbutton7
            properties: "x"
            to: 250
            duration: animationTime
        }
        PropertyAnimation {
            targets: [pushbutton1, pushbutton2, pushbutton3, pushbutton4, pushbutton5]
            properties: "x"
            easing.type: Easing.OutCubic
            to: -animationX-800
            duration: animationTime
        }
        PropertyAnimation {
            targets: [pushbutton4, pushbutton6]
            properties: "y"
            easing.type: Easing.OutCubic
            to: -animationX-800
            duration: animationTime
        }

        onStopped: {
            console.log("NewMusicSelectionPage.qml")
            handlerLoader("NewMusicSelectionPage.qml", 0)
        }
    }

    anchors.fill: parent
    color: "transparent"

    signal handlerLoader(string name, int index)
    Rectangle {
        id: rectangle1
        property double zAngle:0
        transform: Rotation { origin.x: 0; origin.y: rectangle1.height/2;origin.z:0; axis {x:0; y:1; z:0} angle:rectangle1.zAngle }
        x: 100
        y: 20
        width: 194
        height: 633
        color: "transparent"
        FlipButton {
            id: pushbutton1
            x: 0
            y: 0
            width: 194
            height: 234
            clip: false
            image: "images/lang.png"

            onClicked: {
//                zAnimation.running = false
                showShaders(false)
                langAnimation.start()
            }
        }

        FlipButton {
            id: pushbutton2
            x: 0
            y: 250
            width: 194
            height: 233
            image: "images/fav.png"

            onClicked: {
//                handlerLoader("FavoritePage.qml", 1)
                showShaders(false)
                favoriteAnimation.start()
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
            antialiasing: true
        }
        //第一列水波效果
        ShaderEffectSource {
            id: theSource1
            sourceItem: image1
            smooth: true
            hideSource:true
    //        live:false
        }
        ShaderEffect {
            id:shader1
            x: image1.x
            y: image1.y
            width: image1.width
            height: image1.height
            property variant source: theSource1
            property real amplitude: 0.04 * 0.1
            property real frequency: 10
            property real time: 0
            NumberAnimation on time { loops: Animation.Infinite; from: 0; to: Math.PI * 2; duration: 1000 }
            fragmentShader:
                "uniform highp float amplitude;" +
                "uniform highp float frequency;" +
                "uniform highp float time;" +
                "uniform sampler2D source;" +
                "varying highp vec2 qt_TexCoord0;" +
                "uniform lowp float qt_Opacity;" +
                "void main() {" +
                "    highp vec2 p = sin(time + frequency * qt_TexCoord0);" +
                "    gl_FragColor = qt_Opacity * texture2D(source, qt_TexCoord0 + amplitude * vec2(p.y, -p.x));" +
                "}"
        }
    }

    Rectangle {
        id: rectangle2
        anchors.left: rectangle1.right
        anchors.leftMargin: 10
        property double zAngle:0
        property double xDelta:0
        transform: [
            Rotation { origin.x: rectangle2.width/2; origin.y: rectangle2.height/2;origin.z:0; axis {x:0; y:1; z:0} angle:rectangle2.zAngle },
            Translate { x: rectangle2.xDelta }
        ]
//        x: 300
        y: 20
        width: 436
        height: 634
        color: "transparent"
        FlipButton {
            id: pushbutton3
            x: 0
            y: 0
            width: parent.width
            height: 484
            image: "images/star.png"

            onClicked: {
//                handlerLoader("StarSelectionPage.qml", 2)
                showShaders(false)
                starAnimation.start()
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
            antialiasing: true
        }
        //第二列水波效果
        ShaderEffectSource {
            id: theSource2
            sourceItem: image2
            smooth: true
            hideSource:true
    //        live:false
        }
        ShaderEffect {
            id: shader2
            x: image2.x
            y: image2.y
            width: image2.width
            height: image2.height
            property variant source: theSource2
            property real amplitude: 0.04 * 0.1
            property real frequency: 10
            property real time: 0
            NumberAnimation on time { loops: Animation.Infinite; from: 0; to: Math.PI * 2; duration: 1000 }
            fragmentShader:
                "uniform highp float amplitude;" +
                "uniform highp float frequency;" +
                "uniform highp float time;" +
                "uniform sampler2D source;" +
                "varying highp vec2 qt_TexCoord0;" +
                "uniform lowp float qt_Opacity;" +
                "void main() {" +
                "    highp vec2 p = sin(time + frequency * qt_TexCoord0);" +
                "    gl_FragColor = qt_Opacity * texture2D(source, qt_TexCoord0 + amplitude * vec2(p.y, -p.x));" +
                "}"
        }
    }

    Rectangle {
        id: rectangle3
        property double zAngle:0
        transform: Rotation { origin.x: rectangle3.width; origin.y: rectangle3.height/2;origin.z:0; axis {x:0; y:1; z:0} angle:rectangle3.zAngle }
//        x: 744
        y: 20
        width: 420
        height: 634
        anchors.left: rectangle2.right
        anchors.leftMargin: 10
        color: "transparent"
        FlipButton {
            id: pushbutton4
            x: 0
            y: 49
            width: 141
            height: 187
            image: "images/title.png"

            onClicked: {
//                handlerLoader("TopicSelectionPage.qml", 3)
                showShaders(false)
                topicAnimation.start()
            }
        }

        FlipButton {
            id: pushbutton5
            x: 0
            y: 246
            width: 141
            height: 187
            image: "images/top.png"

            onClicked: {
//                handlerLoader("RankSelectionPage.qml", 4)
                showShaders(false)
                rankAnimation.start()
            }
        }

        FlipButton {
            id: pushbutton6
            x: 145
            y: 0
            width: 272
            height: 236
            image: "images/song.png"

            onClicked: {
//                handlerLoader("MusicSelectionPage.qml", 5)
                showShaders(false)
                musicAnimation.start()
            }
        }

        FlipButton {
            id: pushbutton7
            x: 145
            y: 246
            width: 272
            height: 236
            image: "images/newsong.png"

            onClicked: {
//                handlerLoader("NewMusicSelectionPage.qml", 6)
                showShaders(false)
                newMusicAnimation.start()
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
            antialiasing: true
        }

        Image {
            id: image4
            x: 145
            y: 457
            width: 272
            height: 177
            fillMode: Image.PreserveAspectFit
            source: "images/dy-new.png"
            antialiasing: true
        }
        //第三,四列水波效果
        ShaderEffectSource {
            id: theSource3
            sourceItem: image3
            smooth: true
            hideSource:true
    //        live:false
        }
        ShaderEffectSource {
            id: theSource4
            sourceItem: image4
            smooth: true
            hideSource:true
    //        live:false
        }
        ShaderEffect {
            id: shader3
            x: image3.x
            y: image3.y
            width: image3.width
            height: image3.height
            property variant source: theSource3
            property real amplitude: 0.04 * 0.1
            property real frequency: 10
            property real time: 0
            NumberAnimation on time { loops: Animation.Infinite; from: 0; to: Math.PI * 2; duration: 1000 }
            fragmentShader:
                "uniform highp float amplitude;" +
                "uniform highp float frequency;" +
                "uniform highp float time;" +
                "uniform sampler2D source;" +
                "varying highp vec2 qt_TexCoord0;" +
                "uniform lowp float qt_Opacity;" +
                "void main() {" +
                "    highp vec2 p = sin(time + frequency * qt_TexCoord0);" +
                "    gl_FragColor = qt_Opacity * texture2D(source, qt_TexCoord0 + amplitude * vec2(p.y, -p.x));" +
                "}"
        }
        ShaderEffect {
            id: shader4
            x: image4.x
            y: image4.y
            width: image4.width
            height: image4.height
            property variant source: theSource4
            property real amplitude: 0.04 * 0.1
            property real frequency: 10
            property real time: 0
            NumberAnimation on time { loops: Animation.Infinite; from: 0; to: Math.PI * 2; duration: 600 }
            fragmentShader:
                "uniform highp float amplitude;" +
                "uniform highp float frequency;" +
                "uniform highp float time;" +
                "uniform sampler2D source;" +
                "varying highp vec2 qt_TexCoord0;" +
                "uniform lowp float qt_Opacity;" +
                "void main() {" +
                "    highp vec2 p = sin(time + frequency * qt_TexCoord0);" +
                "    gl_FragColor = qt_Opacity * texture2D(source, qt_TexCoord0 + amplitude * vec2(p.y, -p.x));" +
                "}"
        }
    }
}
