import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Particles 2.0

Rectangle {
    width: 1280
    height: 720
    color: "transparent"
    Loader {
        id:mainloader;
        anchors.fill: parent;
        sourceComponent: textprerender;
        Component {
            id:mainpage;
            MainPage{

            }
        }
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
                    onClicked: {
                        mainloader.sourceComponent = mainpage;
                    }
                }
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
