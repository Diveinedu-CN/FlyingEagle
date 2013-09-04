
var DrawerWidth = 280;
var DrawerHeight = 40;
var DrawerMargin = 10;


var EnableVirtualKeyboard = true

var myArray = new Array();

function getList() {
    return myArray
}

function addItem(x, y) {
    myArray.push({'x':x, 'y':y})
}

function clear() {
    myArray = [];
}
