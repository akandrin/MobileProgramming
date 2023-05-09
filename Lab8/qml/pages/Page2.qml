import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.Lab8.MyStringList 0.1

Page {

    id: page

    // 6. Создать приложение, позволяющее добавить введённое слово и удалить последнее добавленное с использованием данного класса в QML.
    // Слова сохраняются в нижнем регистре.
    // 7. Реализовать свойство только для чтения, которое позволяет получить список всех строк в виде одной,
    // перечисленных через запятую и использовать это свойство для вывода добавленных строк на экран.
    // Свойство должно моментально реагировать на изменение содержимого списка, первое слово начинается с заглавной буквы.

    Column {
        id: column

        width: page.width
        spacing: Theme.paddingLarge

        MyStringList
        {
            id: stringList
        }

        TextField
        {
            id: textField
            width: parent.width
            placeholderText: "Введите слово"
        }

        Button
        {
            width: parent.width
            text: "Добавить слово"
            onClicked: stringList.addString(textField.text.toLocaleLowerCase())
        }

        Button
        {
            width: parent.width
            text: "Удалить слово"
            onClicked: stringList.removeLastString()
        }

        TextArea {
            width: parent.width
            height: 700
            anchors.horizontalCenter: parent.horizontalCenter
            color: Theme.secondaryHighlightColor
            font.pixelSize: Theme.fontSizeExtraLarge
            text: stringList.text
            readOnly: true
        }
    }
}
