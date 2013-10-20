import QtQuick 2.0

Rectangle {
    id:_id
    width: 100
    height: 64
    color: "transparent"

    property url background: ""
    property alias text: label.text
    property int tag: 0

    signal clicked(Item item)

    Image {
        anchors.bottom: _id.bottom;
        source: background
    }

    Text {
        id: label
        color: "#FFFFFFFF"
        font.pixelSize: 22
        anchors.centerIn: _id
    }

    MouseArea {
        anchors.fill: _id

        onClicked: {
            _id.clicked(_id);
        }
    }
}
