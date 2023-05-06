import QtQuick 2.0
import Sailfish.Silica 1.0

Page
{
    // 1. Создать приложение, которое будет отображать страницу с двумя кнопками “Назад” и “Вперёд”.
    // Первая удалит текущую страницу со стека, вторая добавит новую. Также на экране нужно отображать текущую глубину стека.
    Column {
        id: column

        width: parent.width
        spacing: Theme.paddingLarge
        PageHeader {
            title: "Страница"
        }
        Button
        {
            text: "Назад"
            onClicked: pageStack.pop()
        }
        Button
        {
            text: "Вперед"
            onClicked: pageStack.push(Qt.resolvedUrl("FirstPage.qml"))
        }
        Label
        {
            text: "Глубина стека: " + pageStack.depth
        }
    }
}
