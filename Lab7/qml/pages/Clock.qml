import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    id: clock
    width: label.width
    height: label.height
    property int seconds: 0
    Timer
    {
        id: timer
        interval: 1000
        repeat: true
        onTriggered: seconds++
    }

    function start()
    {
        clock.seconds = 0;
        timer.start();
    }

    function stop()
    {
        timer.stop();
    }

    function prependWithZeros(num)
    {
        return num > 9 ? num : "0" + num
    }

    Label
    {
        id: label
        text: prependWithZeros(Math.floor(seconds / 3600)) + ":" + prependWithZeros(Math.floor(seconds / 60) % 60) + ":" + prependWithZeros(seconds % 60)
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
