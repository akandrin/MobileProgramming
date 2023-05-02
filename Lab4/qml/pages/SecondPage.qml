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

        // 6) Создать селектор времени, который будет отображать выбранное время в консоли
        Item {
            height: timePicker.height
            width: parent.width
            TimePicker
            {
                id: timePicker
                anchors.horizontalCenter: parent.horizontalCenter
                onTimeTextChanged: console.log(timeText)
            }
            Label
            {
                anchors.centerIn: timePicker
                text: timePicker.timeText
                font.pixelSize: Theme.fontSizeExtraLarge
            }
        }

        // 7) Создать поле с выпадающим списком, позволяющее выбрать строку из списка. Результат выбора отобразить в консоли
        ComboBox {
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            label: "Выпадающий список"
            description: "Выпадающий список с вариантами"
            menu: ContextMenu {
                MenuItem { text: "Первый вариант" }
                MenuItem { text: "Второй вариант" }
                MenuItem { text: "Третий вариант" }
            }
            onValueChanged: console.log(value)
        }

        // 8) Создать переключатель с текстом, в тексте отобразить состояние переключателя “Включен” или “Выключен”
        TextSwitch
        {
            text: checked ? "Включен" : "Выключен"
        }

        // 9) Создать ползунок и поле с текстом. Поле с текстом должно отображать текущее значение ползунка
        Slider {
            width: parent.width
            minimumValue: 0
            maximumValue: 100
            value: 0
            stepSize: 1
            Label
            {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.bottom
                text: "Текущее значение: " + parent.value
            }
        }
    }
}
