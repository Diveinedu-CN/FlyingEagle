import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

Rectangle {
    id: selectedSongPage
    x:820
    y:80
    width: 450
    height: 569
    color:"transparent"
    anchors.rightMargin: 0;
    anchors.bottomMargin: 0;
    property  alias selectedCloseButton: closeButton
    MouseArea {
        anchors.fill: parent
    }

    Image {
        id: selectedSongPageBackGroundImage
        anchors.fill: parent
        source: "images/bg－select.png"
    }
    ExclusiveGroup { id: xuanchangGroup }
    Button {
        id: yixuanButton
        width: 168
        height: 48
        anchors.top: parent.top
        anchors.topMargin: 6
        checkable: true
        checked: true
        exclusiveGroup: xuanchangGroup
        anchors.left: parent.left
        anchors.leftMargin: 14
        Text {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            text: qsTr("已选")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize:26
            font.bold: true
            color:yixuanButton.checked? "black":"white"
        }

        style: ButtonStyle {
            background: Image {
                anchors.fill: parent
                anchors.bottomMargin: 0
                source:yixuanButton.checked?"images/bg-yichang.png":""
            }
            SystemPalette {
            }
        }
    }
    Button {
        id: yichangButton
        width: 168
        height: 48
        anchors.top: parent.top
        anchors.topMargin: 6
        checkable: true
        exclusiveGroup: xuanchangGroup
        anchors.left: yixuanButton.right
        Text {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            text: qsTr("已唱")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize:26
            font.bold: true
            color:yichangButton.checked? "black":"white"
        }

        style: ButtonStyle {
            background: Image {
                anchors.fill: parent
                anchors.bottomMargin: 0
                source:yichangButton.checked?"images/bg-yichang.png":""
            }
            SystemPalette {
            }
        }
    }

    Button {
        id: closeButton
        x: 421
        y: -12
        width: 40
        height: 40
        anchors.bottomMargin: -22
        anchors.topMargin: 60
        anchors.rightMargin: -11
        checkable: true
        anchors.right: parent.right
        anchors.bottom: yichangButton.top

        style: ButtonStyle {
            background: Image {
                anchors.fill: parent
                anchors.bottomMargin: 0
                source:"images/del.png"
            }
            SystemPalette {
            }
        }
    }

    Button {
        id: daluanButton
        width: 72
        height: 40
        checkable: true
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 30;
        anchors.bottomMargin: 30


        style: ButtonStyle {
            background: Image {
                anchors.fill: parent
                anchors.bottomMargin: 0
                source:"images/daluan.png"
            }
            SystemPalette {
            }
        }
    }
    Button {
        id: prevButton
        width: 68
        height: 36
        checkable: true
        anchors.left: daluanButton.right
        anchors.leftMargin: 80
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30


        style: ButtonStyle {
            background: Image {
                anchors.fill: parent
                anchors.bottomMargin: 0
                source:"images/left.png"
            }
            SystemPalette {
            }
        }
    }
    Text {
        id:songCount
        anchors.left: prevButton.right
        anchors.leftMargin: 12
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 38
        text:"10/100"
        font.pixelSize: 20
        color:"white"
    }

    Button {
        id: nextButton
        width: 68
        height: 36
        checkable: true
        anchors.right: parent.right
        anchors.rightMargin: 16
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30


        style: ButtonStyle {
            background: Image {
                anchors.fill: parent
                anchors.bottomMargin: 0
                source:"images/right.png"
            }
            SystemPalette {
            }
        }
    }

}