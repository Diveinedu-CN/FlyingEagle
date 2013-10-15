import QtQuick 2.0
import "componentCreation.js" as ComponentCreation

Rectangle {
    id: container

    signal clicked(Item item)

    function removeChildren() {
        for(var child in container.children) {
            child.destroy();
        }
    }

    function createButtons(titleArray) {
        removeChildren();

        var preButton = null;
        for(var i=0; i<titleArray.length; i++) {
            var button = ComponentCreation.createTabButton(container, titleArray[i]);
            if (preButton == null) {
                button.anchors.left = container.left;
                button.anchors.leftMargin = 20;
            } else {
                button.anchors.left = preButton.right;
                button.anchors.leftMargin = 10;
            }

            button.tag = i;
            button.clicked.connect(clicked)
            preButton = button;
        }
    }
}
