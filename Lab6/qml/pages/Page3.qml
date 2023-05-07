import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    // 3. Выполнить задание 1 с использованием javascript-модели.
    // Вместо свойства model для обращения к полям используем свойство modelData.
    property var dataModel: [
        { colorFont: "black", colorBackground: "white", text: "Белый" },
        { colorFont: "white", colorBackground: "black", text: "Черный" },
        { colorFont: "red", colorBackground: "blue", text: "Синий" }
    ]

    SilicaListView {
        anchors.fill: parent
        model: dataModel
        delegate: Rectangle {
            width: parent.width
            height: 100
            color: modelData.colorBackground
            Text {
                anchors.centerIn: parent
                text: modelData.text
                color: modelData.colorFont
            }
        }
    }
}
