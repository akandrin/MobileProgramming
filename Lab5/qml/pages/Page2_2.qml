import QtQuick 2.0
import Sailfish.Silica 1.0

Page
{
    Column {
        id: column

        width: parent.width
        spacing: Theme.paddingLarge
        PageHeader {
            title: "Вторая страница"
        }
        Button
        {
            text: "Назад"
            onClicked: pageStack.navigateBack()
        }
    }
}
