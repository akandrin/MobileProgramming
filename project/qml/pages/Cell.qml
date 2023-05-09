import QtQuick 2.0

Item {
    id: item
    property int value
    property color itemColor
    signal clicked(var signalValue)

    Rectangle
    {
        width: parent.width
        height: parent.height
        color: itemColor

        Text
        {
            anchors.centerIn: parent
            text: value
            visible: value !== 0
        }

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                if (item.value != 0)
                    item.clicked(item.value);
            }
        }
    }
}
