import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    // 6. Создать приложение со списком SilicaListView, из задач на неделю.
    // Задачи должны содержать дату и описание. В списке задачи группировать по датам.
    ListModel {
        id: animalsModel
        ListElement { description: "Сделать дело"; dateText: "17.02.2017"; }
        ListElement { description: "Гулять смело"; dateText: "17.02.2017"; }
        ListElement { description: "Прочитать книгу"; dateText: "16.02.2017"; }
        ListElement { description: "Сходить на учебу"; dateText: "15.02.2017"; }
    }
    SilicaListView {
        anchors.fill: parent
        model: animalsModel
        header: PageHeader { title: "Задачи" }
        section {
            property: 'dateText'
            delegate: SectionHeader { text: section }
        }
        delegate: Text {
            text: description
            font.pointSize: Theme.fontSizeSmall
            color: "white"
        }
    }
}
