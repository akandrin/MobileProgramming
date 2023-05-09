import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.Lab8.Counter 0.1

Page {
    // 3. Создать приложение с текстовым полем и двумя кнопками. Использовать класс-счётчик в QML:
    // текстовое поле должно отображать текущее значение счётчика,
    // кнопки используются для увеличения значения счётчика на единицу и сброса значения до нуля.
    id: page

    Counter
    {
        id: counter
        // 4. Сделать поле со значением счётчика свойством и инициализировать его каким-либо значением при создании объекта в QML
        value: 0 // проинициализровали каким-либо значением (нулем)
    }

    Column {
        id: column

        width: page.width
        spacing: Theme.paddingLarge

        Label {
            id: label
            x: Theme.horizontalPageMargin
            anchors.horizontalCenter: parent.horizontalCenter
            color: Theme.secondaryHighlightColor
            font.pixelSize: Theme.fontSizeExtraLarge
            text: counter.value
        }
        Button
        {
            width: parent.width
            text: "Увеличить"
            onClicked: counter.increment()
        }
        Button
        {
            width: parent.width
            text: "Сбросить"
            onClicked: counter.reset()
        }
    }
}
