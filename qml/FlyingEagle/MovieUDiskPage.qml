/*
 * U盘加歌和电影播放选择工具条
 *
 * 开发团队: 月光涯信息科技有限公司
 * 官方网址: www.yueguangya.com
 *
 * 功能:
**/

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
        onMovieClicked: movieUDisk.hidePage()
    }

    //显示U盘加个界面
    function showUDisk()
    {
        movieUDisk.udiskVisible = true
        movieUDisk.movieVisible = false
        movieUDisk.visible = true;
    }

    //显示电影播放界面
    function showMovie()
    {
        movieUDisk.udiskVisible = false
        movieUDisk.movieVisible = true
        movieUDisk.visible = true;
    }

    //隐藏工具条
    function hidePage()
    {
        movieUDisk.visible = false;
    }
}
