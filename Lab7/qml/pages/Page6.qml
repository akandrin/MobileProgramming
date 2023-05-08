import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column
    {
        width: parent.width

        Clock {
            id: clock
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Row
        {
            height: 200
            width: parent.width
            Button
            {
                width: parent.width / 2
                text: "Старт"
                onClicked: clock.start()
            }
            Button
            {
                width: parent.width / 2
                text: "Стоп"
                onClicked: clock.stop()
            }

        }
    }

}
