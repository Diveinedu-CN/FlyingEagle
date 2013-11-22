/*
 * 主文件
 *
 * 开发团队: 月光涯信息科技有限公司
 * 官方网址: www.yueguangya.com
 *
 * 功能: 加载点, 主窗口UI
**/

import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Particles 2.0

Rectangle {
    /*
     * 主窗口大小
     **/
    width: 1280
    height: 720
    color: "transparent"

    /*
     * mainLoader
     **/
    Loader {
        id:mainloader;
        anchors.fill: parent;
        sourceComponent: textprerender;
        Component {
            //实际的操作界面, 在字体渲染textprerender完成后进入
            id:mainpage;
            MainPage{

            }
        }

        /*
         * 闪屏页面
         * textprerender, 字体渲染缓存,解决中文字体渲染效率太低导致页面滑动慢的问题, 定时器控制4s后消失, 会加载常用中文字库
         * 目前加载了6000多个汉字
         **/
        Component {
            id: textprerender;
            TextArea {
                anchors.fill: parent;
                font.pixelSize: 20;
                text:"把中文字库的常用汉字放到我这里来,在进去主界面之前进行预渲染.点击屏幕进入主界面.";
                verticalAlignment: TextEdit.AlignVCenter;
                horizontalAlignment: TextEdit.AlignHCenter;
                textColor: "red";
                backgroundVisible: false;
                MouseArea {
                    anchors.fill: parent;
                    /*
                     * 点击进入主界面
                    **/
                    onClicked: {
                        mainloader.sourceComponent = mainpage;
                    }
                }

                /*定时器, 控制字体渲染缓存页停留时间为4s*/
                Timer {
                    id:prerendertimer;
                    interval: 4000; running: true; repeat: false
                    onTriggered: {
                        mainloader.sourceComponent = mainpage;
                    }
                }
            }

        }
    }
}
