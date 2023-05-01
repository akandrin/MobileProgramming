import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page1

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
            width: page1.width
            height: page1.height

            // 2) Нарисовать 3 квадрата красного, зелёного и синего цветов следующим образом
            Item {
                id: item1
                width: page1.width
                height: rectSize * 1.75

                property int rectSize: 200

                Rectangle
                {
                    id: rect1_1
                    color: "red"
                    width: parent.rectSize
                    height : parent.rectSize
                }
                Rectangle
                {
                    id: rect1_2
                    anchors.left: rect1_1.right
                    anchors.top: rect1_1.verticalCenter
                    color: "lime"
                    width: parent.rectSize
                    height: parent.rectSize
                }
                Rectangle
                {
                    id: rect1_3
                    anchors.left : rect1_2.horizontalCenter
                    anchors.bottom: rect1_2.verticalCenter
                    color: "blue"
                    width: parent.rectSize
                    height: parent.rectSize
                    // 3) Поместить текст “Квадрат” белого цвета по центру синего квадрата
                    Text {
                        anchors.centerIn: parent
                        text: qsTr("Квадрат")
                        font.pointSize: parent.rectSize / 6
                        color: "white"
                    }
                }
            }

            // 4) Нарисовать 5 квадратов с использованием Column и Row следующим образом
            Item
            {
                id: item2
                width: page1.width
                height: rectSize * 2.5
                property int rectSize: 150
                property int _spacing : rectSize / 5

                Row
                {
                    spacing : item2._spacing

                    Column
                    {
                        spacing : item2._spacing;

                        Rectangle
                        {
                            width: item2.rectSize
                            height: item2.rectSize
                            color: "red"
                        }
                        Rectangle
                        {
                            width: item2.rectSize
                            height: item2.rectSize
                            color: "fuchsia"
                        }
                    }

                    Column
                    {
                        spacing : item2._spacing;

                        Rectangle
                        {
                            width: item2.rectSize
                            height: item2.rectSize
                            color: "lime"
                        }
                    }

                    Column
                    {
                        spacing : item2._spacing;

                        Rectangle
                        {
                            width: item2.rectSize
                            height: item2.rectSize
                            color: "blue"
                        }
                        Rectangle
                        {
                            width: item2.rectSize
                            height: item2.rectSize
                            color: "black"
                        }
                    }
                }
            }

            // 5) Нарисовать те же 5 квадратов с использованием Grid
            Item
            {
                id: item3

                width: page1.width
                height: rectSize * 2.5

                property int rectSize: 150

                Grid
                {
                    rows: 2
                    columns: 3
                    spacing: parent.rectSize / 5

                    Rectangle
                    {
                        width: item2.rectSize
                        height: item2.rectSize
                        color: "red"
                    }
                    Rectangle
                    {
                        width: item2.rectSize
                        height: item2.rectSize
                        color: "lime"
                    }
                    Rectangle
                    {
                        width: item2.rectSize
                        height: item2.rectSize
                        color: "blue"
                    }
                    Rectangle
                    {
                        width: item2.rectSize
                        height: item2.rectSize
                        color: "fuchsia"
                    }
                    // Это пустой элемент.
                    // Чтобы он добавился в Grid нужно ему добавить видимость, а также ненулевую длину и ширину
                    // (в соответствии с документацией Grid:
                    // If an item within a Grid is not visible, or if it has a width or height of 0,
                    // the item will not be laid out and it will not be visible within the column)
                    Item
                    {
                        visible: true
                        width: item2.rectSize
                        height: item2.rectSize
                    }
                    Rectangle
                    {
                        width: item2.rectSize
                        height: item2.rectSize
                        color: "black"
                    }
                }
            }


            // 6) Сделать из квадрата “A” прямоугольник “B” с использованием объектов Translate, Scale и Rotation
            Item
            {
                id: item4
                width: page1.width
                height: rectSize

                property int rectSize: 150

                Rectangle
                {
                    width: item4.rectSize
                    height: item4.rectSize
                    color: "black"
                }

                Rectangle
                {
                    width: item4.rectSize
                    height: item4.rectSize
                    color: "black"
                    transform: [
                        Scale
                        {
                            xScale: 0.5
                        },
                        Rotation
                        {
                            // вращение происходит вокруг координаты (0; 0) прямоугольника (т.е. вокруг верхнего левого угла)
                            angle: 45
                        },
                        Translate
                        {
                            x: item4.rectSize * 2.5
                        }
                    ]
                }
            }
        }
    }
}
