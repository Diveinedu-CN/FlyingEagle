import QtQuick 2.0
import "componentCreation.js" as ComponentCreation

Rectangle {
    id: container

    width: 1000
    height: 46

    color: "transparent"

    signal clicked(Item item)

    function removeChildren() {
        for(var i=0; i < container.children.length; i++) {
            var child = container.children[i]
            console.log("remove child at index: " + i + " " + child)
            child.trash()
        }
    }

    function createButtons(titleArray) {
        removeChildren();

        var preButton = null;
        for(var i=0; i<titleArray.length; i++) {
            var button = ComponentCreation.createNavButton(container, titleArray[i]);
            if (preButton == null) {
                button.anchors.left = container.left;
                button.anchors.leftMargin = 20;
            } else {
                button.anchors.left = preButton.right;
                button.anchors.leftMargin = 10;
            }

            button.tag = i;
            button.clicked.connect(clicked);

            preButton = button;
        }
    }
}
