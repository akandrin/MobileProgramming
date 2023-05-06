import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    // 7. Создать приложение с SilicaWebView для доступа к вашему любимому сайту.
    SilicaWebView {
        id: webView
        anchors {
            top: parent.top; bottom: urlField.top;
            left: parent.left; right: parent.right;
        }
        url: "http://www.google.ru"
    }
    TextField {
        id: urlField
        anchors {
            left: parent.left; right: parent.right;
            bottom: parent.bottom
        }
        text: "http://www.google.ru"
        label: webView.title
        EnterKey.onClicked: webView.url = text
    }
}
