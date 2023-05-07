import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: startPage

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    Column
    {
        id: column
        width: startPage.width
        height: startPage.height

        Button
        {
            width: parent.width
            text: qsTr("Перейти на страницу 1")
            onClicked: pageStack.push(Qt.resolvedUrl("Page1.qml"))
        }
        Button
        {
            width: parent.width
            text: qsTr("Перейти на страницу 2")
            onClicked: pageStack.push(Qt.resolvedUrl("Page2.qml"))
        }
        Button
        {
            width: parent.width
            text: qsTr("Перейти на страницу 3")
            onClicked: pageStack.push(Qt.resolvedUrl("Page3.qml"))
        }
        Button
        {
            width: parent.width
            text: qsTr("Перейти на страницу 4")
            onClicked: pageStack.push(Qt.resolvedUrl("Page4.qml"))
        }
        Button
        {
            width: parent.width
            text: qsTr("Перейти на страницу 5")
            onClicked: pageStack.push(Qt.resolvedUrl("Page5.qml"))
        }
        Button
        {
            width: parent.width
            text: qsTr("Перейти на страницу 6")
            onClicked: pageStack.push(Qt.resolvedUrl("Page6.qml"))
        }
        Button
        {
            width: parent.width
            text: qsTr("Перейти на страницу 7")
            onClicked: pageStack.push(Qt.resolvedUrl("Page7.qml"))
        }
        Button
        {
            width: parent.width
            text: qsTr("Перейти на страницу 8")
            onClicked: pageStack.push(Qt.resolvedUrl("Page8.qml"))
        }
    }
}
