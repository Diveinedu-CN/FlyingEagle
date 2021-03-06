/*
 * 已选菜单页面
 *
 * 开发团队: 月光涯信息科技有限公司
 * 官方网址: www.yueguangya.com
 *
 * 功能: 已选和已播弹出窗口以及神灯效果
**/
import QtQuick 2.0
import QtQml.Models 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
Item {
    id:_item
    property  alias selectedCloseButton: closeButton
    property alias minimuze: effect.minimize
    property alias bend: effect.bend
    Component.onCompleted: {
        if(_item.visible)
        {
            showUp(true);
        }
    }

    Connections {
        target: _item.selectedCloseButton
        ignoreUnknownSignals:true
        onClicked: {
            showUp(false);
        }
    }
    function showUp(show)
    {
        if(show){
//            effect.minimize = 0;
//            effect.bend = 0;
            showOnAnimation.start();
        }else
        {
//            effect.minimize = 1;
//            effect.bend = 1;
            showOffAnimation.start();
        }
    }

    Rectangle {
        id: selectedSongPage
        x:820
        y: 50
        width: 450
        height: 569
        color:"transparent"
        property  alias selectedCloseButton: closeButton
        MouseArea {
            anchors.fill: parent
        }

        Image {
            id: selectedSongPageBackGroundImage
            anchors.fill: parent
            anchors.top:parent.top
            anchors.topMargin: 12
            source: "images/bg-select.png"
        }
        ExclusiveGroup { id: xuanchangGroup }
        Button {
            id: yixuanButton
            width: 168
            height: 48
            anchors.top: parent.top
            anchors.topMargin: 16
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
            anchors.topMargin: 16
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

        PushButton {
            id: closeButton
            x: 421
            y: 0
            width: 40
            height: 40
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.rightMargin: -11
            anchors.right: parent.right
            backgroundNormal:"images/del.png"


        }
        //已选框中间的列表
        Component {
            id: songItemDelegate
            MouseArea {
                id: dragArea

                property  int size: 20;
                property  int topMargin: 16;
                property bool held: false

                drag.target: held ? content : undefined
                drag.axis: Drag.YAxis

                onPressAndHold: held = true
                onReleased: held = false

                width: grid.cellWidth; height: grid.cellHeight
                anchors.leftMargin: 72

                Rectangle {
                    id: content

                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        verticalCenter: parent.verticalCenter
                    }

                    width: dragArea.width
                    height: dragArea.height

                    Text {
                        id:_seqno;
                        width:20;height: 40;
                        font.pixelSize: 18
                        anchors.left: parent.left;
                        anchors.leftMargin: 10;
                        anchors.top:parent.top;
                        anchors.topMargin: topMargin;
                        color:"red";
                        text: index+".";
                        anchors.verticalCenter: Text.verticalCenter;
                    }
                    Text {
                        id:_name;
                        height: 40;
                        font.pixelSize: 18
                        anchors.left: _seqno.right;
                        anchors.leftMargin: 10;
                        anchors.top:parent.top;
                        anchors.topMargin: topMargin;
                        color:"black";
                        text: name;
                        anchors.verticalCenter: Text.verticalCenter;
                    }
                    Text {
                        id:_star;
                        height: 40;
                        font.pixelSize: 18
                        anchors.right: _firstButton.left;
                        anchors.rightMargin: 20;
                        anchors.top:parent.top;
                        anchors.topMargin: topMargin;
                        color:"black";
                        text: star;
                        anchors.verticalCenter: Text.verticalCenter;
                    }
                    PushButton {
                        id:_firstButton;
                        width:40;height: 40;
                        anchors.right:_delButton.left;
                        anchors.rightMargin: 10;
                        backgroundNormal: "images/first.png";
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    PushButton {
                        id:_delButton;
                        width:40;height: 40;
                        anchors.right: parent.right;
                        backgroundNormal: "images/del.png";
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Drag.active: dragArea.held
                    Drag.source: dragArea
                    Drag.hotSpot.x: width / 2
                    Drag.hotSpot.y: height / 2

                    color: dragArea.held ? "lightsteelblue" : "white"
                    Behavior on color {
                        ColorAnimation {
                            duration: 100
                        }
                    }

                    states: [
                        State {
                            when: dragArea.held

                            ParentChange {
                                target: content
                                parent: grid
                            }

                            AnchorChanges {
                                target: content
                                anchors {
                                    horizontalCenter: undefined
                                    verticalCenter: undefined
                                }
                            }
                        }
                    ]
                }

                DropArea {
                    anchors { fill: parent; margins: 10 }

                    onEntered: {
                        visualModel.items.move(
                                    drag.source.DelegateModel.itemsIndex,
                                    dragArea.DelegateModel.itemsIndex)
                    }
                }
            }
        }

        DelegateModel {
                id: visualModel

                model: TestListModel {}
                delegate: songItemDelegate
            }

        GridView {
            id: grid
            width: 424;
            height: 432
            anchors.left: yixuanButton.left
            anchors.top: yixuanButton.bottom
            cellWidth: grid.width; cellHeight: 54

            property int firstIndexDrag: -1
            property int pageIndex: 1;
            property int pageCount: 1;
            flow: GridView.TopToBottom
            snapMode: GridView.SnapToRow
            clip: true
            cacheBuffer: 42;
            model: visualModel

            //        highlight: Rectangle { width: grid.cellWidth-2; color: "lightblue"; anchors.left: parent.left; anchors.leftMargin: 2; radius: 10 }
            highlightFollowsCurrentItem: true
            focus: true
            onCountChanged: {
                pageCount = Math.floor(count/8)+1;
            }
            onContentXChanged: {
                var tmp = indexAt(contentX+1,0);
               tmp=tmp<0?0:tmp;
                pageIndex = Math.floor(tmp/8) + 1;
            }
            onMovementEnded: {
                currentIndex = indexAt(contentX+1,0);
            }
        }


        //已选框底部栏
        PushButton {
            id: daluanButton
            width: 72
            height: 40
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 30;
            anchors.bottomMargin: 30
            backgroundNormal:"images/daluan.png"

        }
        PushButton {
            id: prevButton
            width: 68
            height: 36
            anchors.left: daluanButton.right
            anchors.leftMargin: 80
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            backgroundNormal:"images/left.png"
            onClicked: grid.moveCurrentIndexLeft();

        }
        Text {
            id:songCount
            anchors.left: prevButton.right
            anchors.leftMargin: 25
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 38
            anchors.horizontalCenter: Text.horizontalCenter
            text:grid.pageIndex+"/"+grid.pageCount;
            font.pixelSize: 18
            color:"white"
        }

        PushButton {
            id: nextButton
            width: 68
            height: 36
            anchors.right: parent.right
            anchors.rightMargin: 16
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            backgroundNormal:"images/right.png"
            onClicked: grid.moveCurrentIndexRight();
        }

    }

    //神灯效果动画
    ShaderEffectSource {
        id: theSource
        sourceItem: selectedSongPage
        smooth: true
        hideSource:true
//        live:false
        sourceRect:Qt.rect(0,-10,selectedSongPage.width+10,selectedSongPage.height)
    }
    ShaderEffect {
        id:effect
        z:selectedSongPage.z+1
        x:selectedSongPage.x
        y:selectedSongPage.y-10
        width: selectedSongPage.width+10
        height: selectedSongPage.height
        mesh: GridMesh { resolution: Qt.size(10, 10) }
        property  alias selectedCloseButton: closeButton
        property variant source: theSource
        property real bend: 1
        property real minimize: 1
        property real side: 0.9
//        SequentialAnimation on bend {
//            loops: Animation.Infinite
//            NumberAnimation { to: 1; duration: 700; easing.type: Easing.InOutSine }
//            PauseAnimation { duration: 1600 }
//            NumberAnimation { to: 0; duration: 700; easing.type: Easing.InOutSine }
//            PauseAnimation { duration: 1000 }
//        }
//        SequentialAnimation on minimize {
//            loops: Animation.Infinite
//            PauseAnimation { duration: 300 }
//            NumberAnimation { to: 1; duration: 700; easing.type: Easing.InOutSine }
//            PauseAnimation { duration: 1000 }
//            NumberAnimation { to: 0; duration: 700; easing.type: Easing.InOutSine }
//            PauseAnimation { duration: 1300 }
//        }
        SequentialAnimation {
            id: showOffAnimation
            PropertyAnimation {
                target: effect
                properties: "bend"
                to: 0.95
                duration: 150
            }
            PropertyAnimation {
                target: effect
                properties: "minimize"
                to: 1
                duration: 150
            }
        }
        SequentialAnimation {
            id: showOnAnimation
            PropertyAnimation {
                target: effect
                properties: "minimize"
                to: 0
                duration: 150
            }
            PropertyAnimation {
                target: effect
                properties: "bend"
                to: 0
                duration: 150
            }
        }
//        Behavior on minimize {
//            NumberAnimation { duration: 500; easing.type: Easing.InOutSine }
//        }
//        Behavior on bend {
//            NumberAnimation { duration: 500; easing.type: Easing.InOutSine }
//        }
        vertexShader: "
            uniform highp mat4 qt_Matrix;
            uniform highp float bend;
            uniform highp float minimize;
            uniform highp float side;
            uniform highp float width;
            uniform highp float height;
            attribute highp vec4 qt_Vertex;
            attribute highp vec2 qt_MultiTexCoord0;
            varying highp vec2 qt_TexCoord0;
            void main() {
                qt_TexCoord0 = qt_MultiTexCoord0;
                highp vec4 pos = qt_Vertex;
                pos.y = mix(qt_Vertex.y, height, minimize);
                highp float t = pos.y / height;
                t = (3. - 2. * t) * t * t;
                pos.x = mix(qt_Vertex.x, side * width, t * bend);
                gl_Position = qt_Matrix * pos;
            }"
    }//ShaderEffect



}//Item
