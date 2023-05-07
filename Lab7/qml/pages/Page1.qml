import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // 1. Создать приложение, отображающее светофор.
    // На экране должно присутствовать 3 разноцветных сигнала, которые загораются и гаснут в том же порядке, что и сигналы светофора.
    // Сделать автоматическую смену состояний.
    Column {
        id: column

        width: page.width
        spacing: Theme.paddingLarge

        states: [
            State
            {
                name: "Stop"
            },
            State
            {
                name: "WaitForStart"
            },
            State
            {
                name: "Wait"
            },
            State
            {
                name: "Start"
            },
            State
            {
                name: "WaitForStop"
            }
        ]
        state: "Stop"

        function switchState()
        {
            if (column.state == "Stop")
                column.state = "WaitForStart"
            else if (column.state == "WaitForStart")
                column.state = "Start"
            else if (column.state == "Start")
                column.state = "WaitForStop"
            else if (column.state == "WaitForStop")
                column.state = "Wait"
            else if (column.state == "Wait")
                column.state = "Stop"
        }

        Button
        {
            width: parent.width
            onClicked:
            {
                column.switchState()
            }
        }

        Timer
        {
            interval: 3500
            running: true
            repeat: true
            onTriggered:
            {
                column.switchState()
            }
        }

        Rectangle
        {
            id: redLight
            anchors.horizontalCenter: parent.horizontalCenter
            width: 300
            height: 300
            radius: width / 2
            color: "maroon"
            states: [
                State
                {
                    name: "On"
                    when: column.state == "Stop" || column.state == "WaitForStart"
                    PropertyChanges {
                        target: redLight
                        color: "red"
                    }
                },
                State
                {
                    name: "Off"
                    when: !(column.state == "Stop" || column.state == "WaitForStart")
                    PropertyChanges {
                        target: redLight
                        color: "maroon"
                    }
                }
            ]
        }
        Rectangle
        {
            id: yellowLight
            anchors.horizontalCenter: parent.horizontalCenter
            width: 300
            height: 300
            radius: width / 2
            color: "darkgoldenrod"
            states: [
                State
                {
                    name: "On"
                    when: column.state == "Wait" || column.state == "WaitForStart"
                    PropertyChanges {
                        target: yellowLight
                        color: "yellow"
                    }
                },
                State
                {
                    name: "Off"
                    when: !(column.state == "Wait" || column.state == "WaitForStart")
                    PropertyChanges {
                        target: yellowLight
                        color: "darkgoldenrod"
                    }
                }

            ]
        }
        Rectangle
        {
            id: greenLight
            anchors.horizontalCenter: parent.horizontalCenter
            width: 300
            height: 300
            radius: width / 2
            color: "darkgreen"
            states: [
                State
                {
                    name: "On"
                    when: column.state == "Start"
                    PropertyChanges {
                        target: greenLight
                        color: "lime"
                    }
                },
                State
                {
                    name: "Switch"
                    when: column.state == "WaitForStop"
                },
                State
                {
                    name: "Off"
                    when: column.state == "Stop" || column.state == "Wait" || column.state == "WaitForStart"
                    PropertyChanges {
                        target: greenLight
                        color: "darkgreen"
                    }
                }
            ]
            transitions: [
                Transition {
                    to: "Switch"
                    SequentialAnimation
                    {
                        loops: Animation.Infinite
                        ScriptAction
                        {
                            script: greenLight.color = "lime"
                        }
                        PauseAnimation {
                            duration: 500
                        }
                        ScriptAction
                        {
                            script: greenLight.color = "darkgreen"
                        }

                        PauseAnimation {
                            duration: 500
                        }
                    }
                }
            ]
        }

    }
}
