import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    // 8. Использовать SlideshowView для просмотра и перелистывания задач на неделю. На одном слайде – одна задача.
    ListModel {
        id: taskModel
        ListElement { description: "Сделать дело"; dateText: "17.02.2017"; }
        ListElement { description: "Гулять смело"; dateText: "17.02.2017"; }
        ListElement { description: "Прочитать книгу"; dateText: "16.02.2017"; }
        ListElement { description: "Сходить на учебу"; dateText: "15.02.2017"; }
    }
    SlideshowView {
        id: view
        anchors.centerIn: parent
        height: width
        itemHeight: width; itemWidth: width;
        model: taskModel
        delegate: Column {
            width: view.itemWidth;
            height: view.itemHeight;
            PageHeader
            {
                title: dateText
            }

            Label {
                text: description
            }
        }
    }
}

