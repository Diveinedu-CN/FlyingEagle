import QtQuick 2.0

ListModel {
    ListElement {
        name: "东方红"
        number: "555 3264"
        star: "张学良"
        image: ""
        subList: []
//            ListElement {
//                nick: "东方红"
//            },
//            ListElement {
//                nick: "马赛曲"
//            },
//            ListElement {
//                nick: "天佑我朝"
//            }
//        ]
    }
    ListElement {
        name: "马赛曲"
        number: "555 8426"
        star: "蒋介石"
        image: ""
        subList: [
            ListElement {
                nick: "东方红"
            },
            ListElement {
                nick: "马赛曲"
            },
            ListElement {
                nick: "天佑我朝"
            }
        ]
    }
    ListElement {
        name: "天佑我朝"
        number: "555 0473"
        star: "毛泽东"
        image: ""
        subList: [
            ListElement {
                nick: "东方红"
            },
            ListElement {
                nick: "马赛曲"
            },
            ListElement {
                nick: "天佑我朝"
            }
        ]
    }
}
