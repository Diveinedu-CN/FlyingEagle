/*
 *创建歌曲选择工具条
**/

var component;
var button;

function createTabButton(container, title) {
    component = Qt.createComponent("TabBarButton.qml")
    button = component.createObject(container, {"text":title})
    button.background = "images/dsc_daohang.png"
//    button.colorText = "#FFFFFFFF"
    button.anchors.top = container.top
    button.height = 35

    return button;
}

function createNavButton(container, title) {
    component = Qt.createComponent("PushButton.qml")
    button = component.createObject(container, {"text":title+">"})
    button.height = 35
    button.colorText = "#FFFFFFFF"

    return button
}
