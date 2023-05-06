import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    property alias result: datePicker.dateText
    Column {
       width: parent.width
       spacing: Theme.paddingMedium
       DialogHeader { }
       // 5) Создать селектор даты, который будет отображать выбранную дату в консоли
       DatePicker
       {
           id: datePicker
           daysVisible: true
           weeksVisible: true
       }
   }
}
