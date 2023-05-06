import QtQuick 2.0
import Sailfish.Silica 1.0

Page
{
    // 5. Создать приложение с одной кнопкой и текстовым полем. После нажатия на кнопку отображается диалог для выбора времени.
    // После согласия с результатом ввода выбранное время отображается в текстовом поле.
    Column {
        id: column

        width: parent.width
        spacing: Theme.paddingLarge
        PageHeader {
            title: "Пятая страница"
        }
        Button
        {
            text: "Открыть диалог"
            onClicked: {
                var dialog = pageStack.push("Sailfish.Silica.TimePickerDialog");
                 dialog.accepted.connect(function() {
                     label.text = dialog.timeText
                 });

            }

        }
        Label
        {
            id: label
            text: ""
        }
    }
}
