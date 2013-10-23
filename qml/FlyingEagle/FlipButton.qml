import QtQuick 2.0

Flipable {
    id: flipable
    property bool flipped: false
    //默认水平翻转
    property bool isHorizontal: true

    property url frontImage: ""
    property url backImage: ""
    property url image: ""

    property alias text: _text.text
    property alias angle: rotation.angle

    signal clicked

    implicitWidth: 80
    implicitHeight: 80

    front: Image {
        anchors.fill: parent

        source: frontImage
        fillMode: Image.PreserveAspectCrop
        asynchronous: true
        sourceSize.width: parent.width
        sourceSize.height: parent.height
    }

    back: Image {
        anchors.fill: parent

        source: backImage
        fillMode: Image.PreserveAspectCrop
        asynchronous: true
        sourceSize.width: parent.width
        sourceSize.height: parent.height
    }

    Image {
            anchors.fill: parent

            source: image
            fillMode: Image.PreserveAspectCrop
            asynchronous: true
            sourceSize.width: parent.width
            sourceSize.height: parent.height
            opacity: maButton.pressed ? 0.8:1
            scale: maButton.pressed ? 0.9:1;
    }

    Text {
        id: _text
        anchors.centerIn: parent

        text: ""
        font.pixelSize: 20
    }

    transform: Rotation {
        id: rotation
        origin.x: flipable.width/2
        origin.y: flipable.height/2
        axis.x: isHorizontal? 0 : 1
        axis.y: isHorizontal? 1 : 0
        axis.z: 0
        angle: 0
    }

    states: State {
        name: "back"
        PropertyChanges {
            target: rotation
            angle: 180
        }
        when: flipable.flipped
    }

    transitions: Transition {
        NumberAnimation { target: rotation; property: "angle"; duration: 2000; easing.type: Easing.InOutQuad }
    }

    MouseArea {
        id: maButton
        anchors.fill: parent
        onClicked: {
            flipable.flipped = !flipable.flipped
            console.log("ok, transition")

            parent.clicked()
        }
    }
}
