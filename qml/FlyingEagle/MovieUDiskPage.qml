import QtQuick 2.0

Rectangle {
    id: movieUDisk

    width: 1280
    height: 720
    property alias movieVisible: moviePage.visible
    property alias udiskVisible: udisk.visible
    MouseArea {
        anchors.fill: parent;
        onClicked: {
           movieUDisk.hidePage();
        }
    }

    UDiskPage {
        id: udisk
        visible: udiskVisible
        width: 1090
        height: 586
        color: "transparent"
        anchors.top: parent.top;
        anchors.topMargin: 60;
        anchors.left: parent.left;
        anchors.leftMargin: 95;
        onUdiskCloseClicked: movieUDisk.hidePage();
    }

    MoviePage {
        id: moviePage
        color: "transparent"
        visible: moviePage.visible
    }


    function showUDisk()
    {
        movieUDisk.udiskVisible = true
        movieUDisk.movieVisible = false
        movieUDisk.visible = true;
    }

    function showMovie()
    {
        movieUDisk.udiskVisible = false
        movieUDisk.movieVisible = true
        movieUDisk.visible = true;
    }
    function hidePage()
    {
        movieUDisk.visible = false;
    }
}
