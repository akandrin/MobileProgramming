import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    id: dialog

    property int currentResult: 0

    // 8) Реализовать диалог с двумя текстовыми полями, в которые вводятся числа.
    // После нажатия на кнопку “Подтвердить” в консоль выводится сумма чисел.
    // Для преобразования строк к числам использовать функцию parseInt(“42”).
    // Валидацией и обработкой ошибок можно пренебречь.
    Column
    {
        anchors.fill: parent
        width: parent.width
        spacing: Theme.paddingMedium

        DialogHeader { } // для кнопок "подтвердить" и "отмена" наверху диалога
        Row
        {
            width: parent.width

            spacing: Theme.paddingMedium
            TextField {
                id: firstOperand
                width: parent.width / 2.5
            }
            TextField {
                id: secondOperand
                width: parent.width / 2.5
            }
        }
        Button
        {
            width: parent.width
            text: qsTr("Сложить")
            onClicked:
            {
                dialog.currentResult = parseInt(firstOperand.text) + parseInt(secondOperand.text)
            }
        }
    }
    onAccepted: console.log(dialog.currentResult)
}
