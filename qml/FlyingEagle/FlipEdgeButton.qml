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
    property alias originX: rotation.origin.x
    property alias originY: rotation.origin.y

    implicitWidth: 80
    implicitHeight: 80

    front: Image {
        anchors.fill: parent

        source: frontImage
        fillMode: Image.PreserveAspectCrop
    }

    back: Image {
        anchors.fill: parent

        source: backImage
        fillMode: Image.PreserveAspectCrop
    }

    Image {
            anchors.fill: parent

            source: image
            fillMode: Image.PreserveAspectCrop
    }

    Text {
        id: _text
        anchors.centerIn: parent

        text: "Test"
        font.pixelSize: 20
    }

    transform: Rotation {
        id: rotation
        origin.x: 0
        origin.y: 0
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
        anchors.fill: parent
        onClicked: {
            flipable.flipped = !flipable.flipped
            console.log("ok, transition")
        }
    }
}
