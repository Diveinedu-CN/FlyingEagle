/*
 * 电影折叠列表
 *
 * 开发团队: 月光涯信息科技有限公司
 * 官方网址: www.yueguangya.com
 *
 * 功能: 实现了类似与QQ的折叠菜单功能
**/

import QtQuick 2.0

Item {
    id:main
    width: 260
    height: 460

    TestModel2 {
        id: testModel
    }

    //一级菜单
    ListView {
        id: listView
        anchors.fill: parent
        spacing: 20
        cacheBuffer: 10
        clip: true

        model: testModel
        delegate: Rectangle {
            property alias itemHeight: cell.height
            property bool unfold: false
            property int tag: index

            id: cell

            width: 260
            height: 32
            color: "transparent"

            //箭头图标
            Image {
                anchors.fill: parent
                source: ((subList.count === 0) && (listView.currentIndex===index))?"images/movieSelected.png":""
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    listView.currentIndex = index
                    if(subList.count === 0) {
                        return
                    }

                    if(!cell.unfold) {
                        cell.height = (subList.count + 1) * 50
                        arrowImage.source = "images/movieUp.png"
                    } else {
                        cell.height = 32
                        arrowImage.source = "images/movieDown.png"
                    }

                    cell.unfold = !cell.unfold
                }
            }

            Item {
                id: mainList

                anchors.top: cell.top
                anchors.left: cell.left
                width: 260
                height: 20

                Text {
                    anchors.left: parent.left
                    text: name
                    color: "white"
                    font.pixelSize: 18
                }

                Image {
                    id: arrowImage
                    anchors.left: parent.left
                    anchors.leftMargin: 200
                    visible: subList.count?true:false

                    source: cell.unfold ? "images/movieUp.png" :"images/movieDown.png"
                }
            }

            //二级菜单
            Column {
                anchors.top: mainList.bottom
                anchors.topMargin: 40
                spacing: 20

                Repeater {
                    id: repeater
                    property int currentIndex: -1

                    model: cell.unfold ? subList : 0
                    delegate: Item {
                        width: 260
                        height: 32

                        Image {
                            anchors.fill: parent
                            source: "images/movieSelected.png"
                            visible: (repeater.currentIndex===index && listView.currentIndex == cell.tag)?true:false
                        }

                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            text: nick
                            color: "white"
                            font.pixelSize: 18
                        }

                        MouseArea {
                            anchors.fill: parent

                            onClicked: {
                                listView.currentIndex = cell.tag
                                repeater.currentIndex = index
                            }
                        }
                    }
                }
            }
        }
    }
}
