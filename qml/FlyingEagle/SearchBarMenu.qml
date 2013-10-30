import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

Rectangle {
    id: searchDiv;
    property alias menuList: menuList;
    signal handleSearch(string title, int type)

    width: 330; height:316;
    color: "transparent";
    Image {
        anchors.top: parent.top;
        anchors.right: parent.right;
        width: 330; height: 46;
        source: "images/searchbar.png"
    }
    TextField {
        id:searchBar
        anchors.top: parent.top
        anchors.topMargin: -2
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left;
        anchors.leftMargin: 40;
        width: 330;
        height: 46
        maximumLength: 20
        placeholderText: qsTr("S搜(歌星/歌名/歌词)")
        font.pixelSize: 18
        style: TextFieldStyle {
            id:style
            textColor: "#F0F0F0"
            background: Rectangle {
                anchors.top: parent.top;
                anchors.right: parent.right;
                width: 330; height: 46;
                color: "transparent"
            }
            panel:Item {
                anchors.fill: parent
                property font font
                property color textColor: style.textColor
                property color selectionColor: style.selectionColor
                property color selectedTextColor: style.selectedTextColor
                implicitWidth: backgroundLoader.implicitWidth ? backgroundLoader.implicitWidth : 100
                implicitHeight: backgroundLoader.implicitHeight ? backgroundLoader.implicitHeight : 46
                property color placeholderTextColor: Qt.rgba(1, 1, 1, 0.8)
                Loader {
                    id: backgroundLoader
                    sourceComponent: background
                    anchors.fill: parent
                }
            }
        }

        Keys.onReleased: {
            if (searchBar.text.length >= 0)
            {
                searchDiv.menuList.needdisplay = true;
            }else
            {
                searchDiv.menuList.needdisplay = false;
            }
        }



        MouseArea {
            anchors.fill: parent
            onClicked: {
                searchBar.forceActiveFocus();
                if(keyboard.state === "show")
                {
                    keyboard.state = "hide";
                    popContentAreaTimer.start();
                }else
                {
                    popContentArea.visible = true;
                    keyboard.state = "show";
                }

                if (searchBar.text.length >= 0)
                {
                    searchDiv.menuList.needdisplay = true;
                }else
                {
                    searchDiv.menuList.needdisplay = false;
                }
            }
        }
    }

    Rectangle  {
        id:menuList
        z:searchBar.z-10;
        property bool needdisplay: false;
        anchors.left: parent.left;
        anchors.top: parent.top;
        anchors.topMargin: 8;
        anchors.leftMargin: 4;
        width: parent.width-6; height:needdisplay?parent.height:0;
        color: "transparent"
        clip: true;
        Behavior on height {
                NumberAnimation { easing.type: Easing.InSine; duration: 100 }
        }
        MouseArea {
            anchors.fill: parent;
            onClicked: ;
        }

        Image {
            anchors.top: parent.top;
            anchors.right: parent.right;
            anchors.topMargin: 0
            anchors.fill: parent;
            source: "images/bg.png"
        }

        Component {
            id: searchBarDelegate
            Item {
                id:_item;
                width: parent.width; height: 44
                anchors.left: parent.left;
                anchors.leftMargin: 10;
                Image {
                    id: img;
                    anchors.verticalCenter: _item.verticalCenter;
                    property int rettype: 3;
                    property string starImg: "images/1.png";
                    property string songUnique: "images/3.png";
                    property string songMore: "images/2.png";
                    source: rettype==1?starImg:(rettype==2?songUnique:songMore);
                }
                Text {
                    id:_name;
                    height: 44;
                    font.pixelSize: 20
                    anchors.top: img.top;
                    anchors.left: img.right;
                    anchors.leftMargin: 10;
                    color:"white";
                    text: name;
                }


            }
        }

        ListView {
            anchors.fill: parent
            anchors.left: parent.left;
            focus: true;
            anchors.topMargin: 42;
            anchors.bottomMargin: 60;
            cacheBuffer: 80;
            clip:true;
            interactive: false
            snapMode: ListView.SnapToItem;
            model: TestListModel {}
            delegate: searchBarDelegate;
        }
        PushButton {
            id: searchButton
            anchors.bottom: parent.bottom;
            anchors.bottomMargin: 10;
            anchors.right: parent.right;
            anchors.rightMargin: 10;
            width: 81
            height: 36
            text: "搜索"
            colorText: "white"
            backgroundNormal: "images/searchButton.png"
            onClicked: {
                keyboard.state = "hide";
                popContentAreaTimer.start();
                searchDiv.handleSearch("", 0)
            }
        }
    }
}
