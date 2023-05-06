import QtQuick 2.0
import Sailfish.Silica 1.0

Page
{
    // 4. Создать приложение с одной кнопкой и текстовым полем. После нажатия на кнопку отображается диалог для выбора даты.
    // После согласия с результатом ввода выбранная дата отображается в текстовое поле.
    Column {
        id: column

        width: parent.width
        spacing: Theme.paddingLarge
        PageHeader {
            title: "Четвертая страница"
        }
        Button
        {
            text: "Открыть диалог"
            onClicked: {
                var dialog = pageStack.push("Sailfish.Silica.DatePickerDialog");
                dialog.accepted.connect(function() {
                    label.text = dialog.dateText
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
