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
            property var currentY
            property var currentRotation
            property var currentColor

            states: [
                State
                {
                    name: "Pressed"

                    PropertyChanges
                    {
                        target: label
                        y: 900
                        rotation: 180
                        color: "blue"
                    }
                },
                State
                {
                    name: "Released"
                    PropertyChanges {
                        target: label
                        y: label.currentY
                        rotation: label.currentRotation
                        color: label.currentColor
                    }
                },
                State
                {
                    name: "StartState"
                    PropertyChanges {
                        target: label
                        y: 0
                        rotation: 0
                        color: "red"
                    }
                }

            ]

            Timer
            {
                id: timer
                interval: 0
                repeat: false
                onTriggered: {
                    console.log("Here");
                    if(label.startTime !== undefined)
                        returnAnimation.returnTime = new Date().getTime() - label.startTime;
                    console.log("Return time = " + returnAnimation.returnTime);
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
                            script: label.startTime = new Date().getTime()
                        }

                        NumberAnimation
                        {
                            properties: "y,rotation"
                            duration: 5000
                        }
                    }
                    ColorAnimation {
                        duration: 5000
                    }
                    onRunningChanged: {
                        if (!running)
                        {
                            label.currentY = label.y
                            label.currentRotation = label.rotation
                            label.currentColor = label.color
                        }
                    }
                },
                Transition {
                    to: "Released"
                    SequentialAnimation
                    {
                        ScriptAction
                        {
                            script: timer.start()
                        }
                    }
                },
                Transition
                {
                    id: returnAnimation
                    property int returnTime
                    to: "StartState"
                    NumberAnimation
                    {
                        properties: "y,rotation"
                        duration: returnAnimation.returnTime
                    }
                    ColorAnimation {
                        duration: returnAnimation.returnTime
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
