import QtQuick 2.0
import Sailfish.Silica 1.0

Page
{
    // 3. Создать приложение с одной кнопкой и текстовом поле. После нажатия на кнопку отображается диалог для ввода текста.
    // После согласия с результатом введённый текст отображается в текстовое поле.
    Column {
        id: column

        width: parent.width
        spacing: Theme.paddingLarge
        PageHeader {
            title: "Третья страница"
        }
        Button
        {
            text: "Открыть диалог"
            onClicked: {
                var dialog = pageStack.push(Qt.resolvedUrl("Page3_2.qml"));
                dialog.accepted.connect(function() {
                    label.text = dialog.textFieldValue;
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
