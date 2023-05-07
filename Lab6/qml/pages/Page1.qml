import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    // 1. Создать приложение, которое позволяет отображать список из прямоугольников с использованием ListModel.
    // В модели должны настраиваться цвет фона и текста внутри прямоугольника. Текст содержит название цвета фона прямоугольника.
    ListModel {
        id: dataModel
        ListElement { colorFont: "black"; colorBackground: "white"; text: "Белый"; }
        ListElement { colorFont: "white"; colorBackground: "black"; text: "Черный"; }
        ListElement { colorFont: "red"; colorBackground: "blue"; text: "Синий"; }
    }
    SilicaListView {
        anchors.fill: parent
        model: dataModel
        delegate: Rectangle {
            width: parent.width
            height: 100
            color: model.colorBackground
            Text {
                anchors.centerIn: parent
                text: model.text
                color: model.colorFont
            }
        }
    }
}
