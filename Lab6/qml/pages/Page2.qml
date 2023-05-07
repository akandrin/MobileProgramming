import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    // 2. Создать приложение, которое позволяет отображать список из прямоугольников.
    // Нажатие на кнопку над списком добавит новый элемент.
    // Нажатие на элемент в списке удалит его из списка.
    // В прямоугольниках должен отображаться порядковый номер, присваиваемый при добавлении в список.
    // При удалении элементов порядковые номера у добавленных прямоугольников  остаются
    id: page
    ListModel { id: dataModel }
    Column {
        width: page.width

        Button {
            id: addButton
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Добавить"

            property int counter: 1
            onClicked: dataModel.append({ text: "Элемент " + counter++ })
        }
        SilicaListView {
            VerticalScrollDecorator{}

            width: parent.width;
            height: 800
            header: PageHeader { title: "Список" }
            model: dataModel
            delegate: Rectangle {
                width: parent.width; height: 70; color: "skyblue";
                Text {
                    anchors.centerIn: parent
                    text: model.text
                }
                MouseArea
                {
                    anchors.fill: parent
                    onClicked: dataModel.remove(model.index)
                }

            }
        }
    }
}
