import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    // 9. Создать приложение с вытягиваемыми меню сверху и снизу и текстовым полем.
    // После выбора какого-либо элемента меню, его название отобразить в текстовом поле.

    id: page

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        PullDownMenu {
            MenuItem {
                text: "Menu Item 1"
                onClicked: label.text = text
            }
            MenuItem {
                text: "Menu Item 2"
                onClicked: label.text = text
            }
        }
        PushUpMenu {
            MenuItem {
                text: "Menu Item 3"
                onClicked: label.text = text
            }
            MenuItem {
                text: "Menu Item 4"
                onClicked: label.text = text
            }
        }

        Column
        {
            id: column
            width: page.width
            PageHeader
            {
                title: "Страница с меню"
            }
            Label
            {
                id: label
                text: ""
            }
        }
    }
}
