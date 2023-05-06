import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    property alias result: timePicker.timeText
    Column {
       width: parent.width
       spacing: Theme.paddingMedium
       DialogHeader { }
       // 5) Создать селектор даты, который будет отображать выбранную дату в консоли
       Item {
           height: timePicker.height
           width: parent.width
           TimePicker
           {
               id: timePicker
               anchors.horizontalCenter: parent.horizontalCenter
               hourMode: DateTime.TwentyFourHours
           }
           Label
           {
               anchors.centerIn: timePicker
               text: timePicker.timeText
               font.pixelSize: Theme.fontSizeExtraLarge
           }
       }
   }
}
