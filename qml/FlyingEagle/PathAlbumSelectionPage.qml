/*
 *使用PathView来展示专辑列表
**/

import QtQuick 2.0

Rectangle {
    id: container

    width: 1280
    height: 591
    color: "transparent"

    PathView {
        id: pathView

        anchors.topMargin: 120

        anchors.fill: parent

        pathItemCount: 7
        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
        highlightRangeMode: PathView.StrictlyEnforceRange
        flickDeceleration: 390

        model: TestListModel {

        }

        delegate: Item{
            property real tmpAngle : PathView.rotateY
            property real scaleValue: PathView.scalePic
            width: 356
            height: 356
            visible: PathView.onPath
            z: PathView.zOrder

            Image{
                id:myImage
                width: 356
                height: 356
                source: image
                anchors.horizontalCenter: parent.horizontalCenter
                smooth: true
            }

            Text {
                text: index
                color: "red"
            }

            transform:[
                Rotation{
                    angle: tmpAngle
                    origin.x: 356/2
                    axis { x: 0; y: 1; z: 0 }
                },
                Scale {
                    xScale:scaleValue; yScale:scaleValue
                    origin.x: 356/2;   origin.y: 356/2
                }
            ]
        }//Item

        path: Path {
            startX: 0
            startY: 0

            PathLine{x:-60; y: 130}
            PathPercent {value: 0.0}
            PathAttribute {name: "rotateY"; value: 0.0}
            PathAttribute {name: "scalePic"; value: 0.36}
            PathAttribute {name: "zOrder"; value: 1}

            PathLine{x:150; y: 150}
            PathPercent {value: 0.20}
            PathAttribute {name: "rotateY"; value: -50.0}
            PathAttribute {name: "scalePic"; value: 0.50}
            PathAttribute {name: "zOrder"; value: 10}

            PathLine{x:380; y: 190}
            PathPercent {value: 0.40}
            PathAttribute {name: "rotateY"; value: -50.0}
            PathAttribute {name: "scalePic"; value: 0.80}
            PathAttribute {name: "zOrder"; value: 50}

            PathLine{x:640; y: 210}
            PathPercent {value: 0.50}
            PathAttribute {name: "rotateY"; value: 0.0}
            PathAttribute {name: "scalePic"; value: 1.0}
            PathAttribute {name: "zOrder"; value: 60}

            PathLine{x:888; y: 190}
            PathPercent {value: 0.60}
            PathAttribute {name: "rotateY"; value: 50.0}
            PathAttribute {name: "scalePic"; value: 0.8}
            PathAttribute {name: "zOrder"; value: 50}

            PathLine{x:1120; y: 150}
            PathPercent {value: 0.80}
            PathAttribute {name: "rotateY"; value: 50.0}
            PathAttribute {name: "scalePic"; value: 0.50}
            PathAttribute {name: "zOrder"; value: 10}

            PathLine{x:1330; y: 130}
            PathPercent {value: 1.00}
            PathAttribute {name: "rotateY"; value: 0.0}
            PathAttribute {name: "scalePic"; value: 0.36}
            PathAttribute {name: "zOrder"; value: 1}
        }

        focus: true
        Keys.onLeftPressed: decrementCurrentIndex()
        Keys.onRightPressed: incrementCurrentIndex()
    }
}
