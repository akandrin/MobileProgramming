import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    // 6. Создать приложение, позволяющее добавлять и удалять заметки с использованием базы данных и отображать их в списке.
    // Текстовое поле служит для ввода текста, кнопка для добавления заметки, нажатие на заметку удалит её.

    DAO { id: dao }
    Column
    {
        width: parent.width

        TextField
        {
            id: textField
            width: parent.width
            placeholderText: "Введите заметку"
        }

        Button
        {
            text: "Добавить"
            onClicked:
            {
                dao.insertNote(textField.text);
                selectBooks();
            }
        }

        SilicaListView {
            width: parent.width;
            height: 800
            model: ListModel { id: notesListModel }
            delegate: ListItem {
                Label {
                    text: (index + 1) + ". " + description
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            dao.deleteNote(id);
                            selectBooks();
                        }
                    }
                }
            }
        }
    }

    function selectBooks() {
        notesListModel.clear();
        dao.retrieveNotes(function(notes) {
            for (var i = 0; i < notes.length; i++) {
                var note = notes.item(i);
                notesListModel.append({id: note.id, description: note.description});
            }
        });
    }
    Component.onCompleted: selectBooks()
}
