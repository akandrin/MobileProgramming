import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0

Page {
    // 8. Выполнить задание 7 с помощью ConfigurationGroup.
    ConfigurationGroup {
        id: settings
        path: "/apps/Lab6"
        property string textField: ""
        property bool textSwitch: false
    }

    Column {
        width: parent.width
        PageHeader { title: "Settings" }
        TextField {
            width: parent.width
            text: settings.textField
            onTextChanged: settings.textField = text
        }
        TextSwitch
        {
            width: parent.width
            text: checked ? "Включен" : "Выключен"
            checked: settings.textSwitch
            onCheckedChanged: settings.textSwitch = checked
        }
    }
}
