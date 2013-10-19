import QtQuick 2.0

Rectangle {
    id: movieUDisk

    width: 1280
    height: 720
    property alias movieVisible: moviePage.visible
    property alias udiskVisible: udisk.visible

    UDiskPage {
        id: udisk
        visible: udiskVisible
    }

    MoviePage {
        id: moviePage
        visible: moviePage.visible
    }

    function showUDisk()
    {
        movieUdisk.udiskVisible = true
        movieUDisk.movieVisible = false
    }

    function showMovie()
    {
        movieUDisk.udiskVisible = false
        movieUDisk.movieVisible = true
    }
}
