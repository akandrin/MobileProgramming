import QtQuick 2.0
import Sailfish.Silica 1.0

Page
{
    // 2. Создать приложение из двух страниц. Первая страница содержит две кнопки “Добавить страницу” и “Убрать страницу”.
    // Первая кнопка добавит вторую страницу как прикреплённую, вторая кнопка её удалит.
    // На второй странице должна быть кнопка для возврата на первую страницу без закрытия второй.
    Column {
        id: column

        width: parent.width
        spacing: Theme.paddingLarge
        PageHeader {
            title: "Первая страница"
        }
        Button
        {
            text: "Добавить страницу"
            onClicked: pageStack.pushAttached(Qt.resolvedUrl("Page2_2.qml"))
        }
        Button
        {
            text: "Убрать страницу"
            onClicked: {
                pageStack.popAttached()
            }
        }
    }
}
