import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All


    Column {
        id: column

        width: page.width
        spacing: Theme.paddingLarge

        // 6) Создать селектор времени, который будет отображать выбранное время в консоли
        Item {
            height: timePicker.height
            width: parent.width
            TimePicker
            {
                id: timePicker
                anchors.horizontalCenter: parent.horizontalCenter
                onTimeTextChanged: console.log(timeText)
                width: timePicker2.width / 2
                height: timePicker2.height / 2
                z: 1000
            }
            TimePicker
            {
                id: timePicker2
                anchors.horizontalCenter: timePicker.horizontalCenter
                anchors.verticalCenter: timePicker.verticalCenter

                onHourChanged:
                {
                    minute = hour * 5
                }
                onMinuteChanged:
                {
                    hour = (Number)(minute / 5)
                }
            }

            Label
            {
                anchors.centerIn: timePicker
                text: timePicker.timeText + ":" + timePicker2.minute
                font.pixelSize: Theme.fontSizeExtraLarge
            }
        }
    }
}
