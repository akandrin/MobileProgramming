import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All


    Column {
        id: column

        width: page.width
        spacing: Theme.paddingLarge

        // 1) Создать текстовое поле для ввода числа с заголовком и подсказкой
        TextField
        {
            width: parent.width
            label: "Заголовок"
            placeholderText: "Подсказка"
            inputMethodHints: Qt.ImhFormattedNumbersOnly
        }

        // 2) Создать кнопку, которая будет сохранять визуально нажатое состояние, после того, как пользователь нажал на неё один раз
        Button
        {
            width: parent.width
            onClicked: down = true
        }

        // 3) Создать кнопку и поле с текстом. Поле с текстом должно отображать нажата ли кнопка или нет выводом текста “Нажата” или “Отпущена”
        Button
        {
            id: button3_1
            width: 400
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Кнопка"
            onClicked: down = !down
        }
        Label
        {
            text: button3_1.down ? "Нажата" : "Отпущена"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        // 4) Создать кнопку со значением, которая будет отображать количество нажатий на неё
        ValueButton {
            label: "Счётчик"
            description: "Считает количество нажатий"
            value: "0"
            onClicked: value = (parseInt(value) + 1).toString()
        }

        // 5) Создать селектор даты, который будет отображать выбранную дату в консоли
        DatePicker
        {
            daysVisible: true
            weeksVisible: true

            // здесь используется синтаксис https://doc.qt.io/qt-5/qtqml-syntax-objectattributes.html#property-change-signal-handlers
            //  on<Property>Changed where <Property> is the name of the property, with the first letter capitalized
            onDateTextChanged: console.log(dateText)
        }
    }
}
