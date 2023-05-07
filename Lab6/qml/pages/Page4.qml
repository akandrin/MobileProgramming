import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    // 4. Получить и отобразить курсы валют из ресурса ЦБ РФ по адресу http://www.cbr.ru/scripts/XML_daily.asp
    XmlListModel {
        id: xmlListModel
        source: "http://www.cbr.ru/scripts/XML_daily.asp"
        query: "/ValCurs/Valute"
        XmlRole { name: "name"; query: "Name/string()" }
        XmlRole { name: "value"; query: "Value/string()" }
    }
    SilicaListView {
        anchors.fill: parent
        header: PageHeader { title: "Валюты" }
        model: xmlListModel
        delegate: Column {
            x: Theme.horizontalPageMargin
            Label { text: name }
            Label { text: value }
        }
    }
}
