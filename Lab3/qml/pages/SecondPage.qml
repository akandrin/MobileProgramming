import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page2

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        Column
        {
            id: column
            width: page2.width
            height: page2.height

            // 7) Нарисовать квадрат и анимировать его перемещение вниз с увеличением его размера.
            Item
            {
                id: item5;
                width: page2.width
                height: page2.height

                Rectangle
                {
                    id: rect5_1
                    anchors.horizontalCenter: item5.horizontalCenter
                    color: "skyblue"

                    property int rectSize: 300
                    width: rectSize
                    height: rectSize

                    ParallelAnimation
                    {
                        id: parallelAnimation5_1
                        running: true
                        loops: Animation.Infinite
                        property int animationDuration: 7500

                        NumberAnimation {
                            target: rect5_1
                            property: "y"
                            from: -300
                            to: 1600
                            duration: parallelAnimation5_1.animationDuration
                        }

                        NumberAnimation {
                            target: rect5_1
                            property: "rectSize"
                            from: 300
                            to: 600
                            duration: parallelAnimation5_1.animationDuration
                        }
                    }
                }
            }
        }
    }
}
