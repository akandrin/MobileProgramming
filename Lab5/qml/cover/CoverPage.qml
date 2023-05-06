import QtQuick 2.0
import Sailfish.Silica 1.0

Cover {
    Label {
        id: label
        property int counter: 0
        text: counter
        anchors.centerIn: parent
        font.pixelSize: Theme.fontSizeExtraLarge
    }
    CoverActionList {
        CoverAction {
            iconSource: "image://theme/icon-cover-cancel"
            onTriggered: label.counter = 0
        }
        CoverAction {
            iconSource: "image://theme/icon-cover-new"
            onTriggered: label.counter++
        }
    }
}
