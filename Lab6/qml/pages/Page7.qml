import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0

Page {
    // 7. Создать приложение с текстовым полем и полем с флажком, значение которых сохраняется в настройках приложения
    // с помощью ConfigurationValue.
    ConfigurationValue {
        id: textFieldSetting
        key: "/apps/Lab6/textField"
        defaultValue: ""
    }
    ConfigurationValue {
        id: switchSetting
        key: "/apps/Lab6/textSwitch"
        defaultValue: false
    }
    Column {
        width: parent.width
        PageHeader { title: "Settings" }
        TextField {
            width: parent.width
            text: textFieldSetting.value
            onTextChanged: textFieldSetting.value = text
        }
        TextSwitch
        {
            width: parent.width
            text: checked ? "Включен" : "Выключен"
            checked: switchSetting.value
            onCheckedChanged: switchSetting.value = checked
        }
    }
}
