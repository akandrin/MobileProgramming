import QtQuick 2.0
import QtQuick.LocalStorage 2.0

Item {
    property var db;

    Component.onCompleted: {
        db = LocalStorage.openDatabaseSync("notes", "1.0");
        createTable();
    }
    function createTable() {
        db.transaction(function(tx) {
            tx.executeSql("CREATE TABLE IF NOT EXISTS notes (
                id INTEGER PRIMARY KEY AUTOINCREMENT,"
                + "description TEXT NOT NULL);");
        });
    }
    function retrieveNotes(callback) {
        db.readTransaction(function(tx) {
            var result = tx.executeSql("SELECT * FROM notes;");
            callback(result.rows);
        });
    }
    function insertNote(description) {
        db.transaction(function(tx) {
           tx.executeSql("INSERT INTO notes (description) VALUES(?);", [description]);
        });
    }
    function updateNote(id, description) {
        db.transaction(function(tx) {
            tx.executeSql("UPDATE notes SET description = ? WHERE id = ?;", [description, id]);
        });
    }
    function deleteNote(id) {
        db.transaction(function(tx) {
            tx.executeSql("DELETE FROM notes WHERE id = ?;", [id]);
        });
    }

}

