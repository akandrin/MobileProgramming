import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: startPage

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        Column
        {
            id: column
            width: startPage.width
            height: startPage.height

            Button
            {
                width: parent.width
                text: qsTr("Перейти на страницу 1")
                onClicked: pageStack.push(Qt.resolvedUrl("FirstPage.qml"))
            }
            Button
            {
                width: parent.width
                text: qsTr("Перейти на страницу 2")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
            Button
            {
                width: parent.width
                text: qsTr("Перейти на страницу 3")
                onClicked: pageStack.push(Qt.resolvedUrl("ThirdPage.qml"))
            }
        }
    }
}
