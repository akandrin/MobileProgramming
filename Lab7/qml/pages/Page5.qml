import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column
    {
        width: parent.width
        // 5. Создать QML компонент со свойством по умолчанию,
        // который берет значение свойства text любого объявленного внутри него объекта и создает Button с тем же текстом.
        // Добавить возможность задавать цвет кнопки при объявлении компонента.
        Item5
        {
            Label
            {
                text: "Button"
            }
            width: parent.width
            color: "red"
        }
    }
}
