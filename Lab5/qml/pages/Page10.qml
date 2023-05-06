import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    // 10. Создать приложение со списком и контекстным меню.
    // После выбора элемента контекстного меню отобразить в консоли название выбранного элемента меню и индекс элемента списка.

    SilicaListView {
        anchors.fill: parent
        model: 10
        delegate: ListItem {
            id: delegate
            Label {
                x: Theme.paddingLarge
                text: "List Item #" + index
                color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
            }
            menu: ContextMenu {
                MenuLabel { text: "Context Menu" }
                MenuItem {
                    text: "Menu Item 1"
                    onClicked: console.log(text + " (ListItem index = " + index + ")")
                }
                MenuItem {
                    text: "Menu Item 2"
                    onClicked: console.log(text + " (ListItem index = " + index + ")")
                }
            }
        }
    }
}
