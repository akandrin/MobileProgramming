import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // 3. Создать приложение, отображающее строку текста вверху экрана.
    // При нажатии на текст он должен плавно перемещаться вниз экрана, поворачивать на 180 градусов и менять цвет.
    // Когда нажатие прекращается, он должен так же плавно возвращаться в исходное положение.
    Column {
        id: column

        width: page.width
        spacing: Theme.paddingLarge

        Label
        {
            id: label
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Hello world!"
            font.pixelSize: Theme.fontSizeExtraLarge
            state: "StartState"

            property var startTime

            states: [
                State
                {
                    name: "Pressed"
                    StateChangeScript
                    {
                        name: "OnPressed"
                        script: label.startTime = new Date().getTime()
                    }

                    PropertyChanges
                    {
                        target: label
                        y: 900
                    }
                },
                State
                {
                    name: "Released"
                    StateChangeScript
                    {
                        name: "OnReleased"
                        script: {
                            console.log("Here");
                            if(label.startTime !== undefined)
                                returnAnimation.returnTime = new Date().getTime() - label.startTime;
                            console.log("Return time = " + returnAnimation.returnTime);
                        }
                    }
                },
                State
                {
                    name: "StartState"
                    PropertyChanges {
                        target: label
                        y: 0
                    }
                }

            ]

            Timer
            {
                id: timer
                interval: 0
                repeat: false
                onTriggered: {
                    console.log("Change state to start")
                    label.state = "StartState"
                }
            }

            transitions: [
                Transition
                {
                    to: "Pressed"
                    SequentialAnimation
                    {
                        ScriptAction
                        {
                            scriptName: "OnPressed"
                        }

                        NumberAnimation
                        {
                            properties: "y"
                            duration: 5000
                        }
                    }
                },
                Transition {
                    to: "Released"
                    SequentialAnimation
                    {
                        ScriptAction
                        {
                            scriptName: "OnReleased"
                        }

                        ScriptAction
                        {
                            script: timer.start()
                        }
                    }
                },
                Transition
                {
                    to: "StartState"
                    SequentialAnimation
                    {
                        ScriptAction
                        {
                            script: console.log(returnAnimation.returnTime)
                        }

                        NumberAnimation
                        {
                            id: returnAnimation
                            property int returnTime
                            properties: "y"
                            duration: 3000
                        }
                    }
                }

            ]
            MouseArea
            {
                anchors.fill: label
                onPressed: label.state = "Pressed"
                onReleased: label.state = "Released"
            }
        }
    }
}
