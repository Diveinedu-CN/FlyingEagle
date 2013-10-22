import QtQuick 2.0


Rectangle {
    id: pushButton

    property alias text: label.text
    property url backgroundNormal: ""
    property url backgroundPressed: ""
    property url icon: ""
    property color colorNormal: "#a0a0a0"
    property color colorPressed: "#d0d0d0"
    property color colorText: "#000000"
    property int tag: 0

    signal clicked(Item item)

    width: 64
    height: 64
    smooth: true
    color: "#00000000"

//    color: backgroundNormal != "" ? "#00000000"
//                                  : maButton.pressed ? colorPressed
//                                                     : colorNormal

//    border.width: 2
//    border.color: maButton.pressed ? "#313131" : colorPressed

//    gradient: Gradient {
//        GradientStop { position: 0.0; color: maButton.pressed ? colorPressed : colorNormal; }
//        GradientStop { position: 1.0; color: maButton.pressed ? colorNormal : colorPressed; }
//    }

//    radius: 5

    Image {
        id: bg
        width: parent.width;height: parent.height
        visible: backgroundNormal != ""
        fillMode: Image.PreserveAspectFit
        source: maButton.pressed ? backgroundPressed : backgroundNormal
        anchors.fill: parent
        antialiasing: true
        asynchronous: true
        sourceSize.width: parent.width
        sourceSize.height: parent.height
    }

    Image {
        id: iconImage
        visible: icon != ""
        source: icon
        anchors.fill: parent
        anchors.centerIn: parent
        antialiasing: true
        asynchronous: true
        sourceSize.width: parent.width
        sourceSize.height: parent.height
    }

    Text {
        id: label
        color: colorText
        //font.bold: true
        font.pixelSize: 20
        visible: text != ""
        anchors.centerIn: parent
    }

    MouseArea {
        id: maButton
        anchors.fill: parent

        onClicked: {
            parent.clicked(pushButton);
        }
    }

    function trash() {
        pushButton.destroy()
    }
}
