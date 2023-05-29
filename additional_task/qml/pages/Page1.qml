import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.Lab8.Benchmark 0.1

Page {
    id: page

    Benchmark{
        id: benchmark
        onUpdateCPU:
        {
            cpuLabel.text = 'CPU: ' + (percent + '').slice(0, 5) + '%'
            cpuDiagram.angle = percent / 100 * Math.PI * 2
        }

        onUpdateRAM:
        {
            ramLabelTotal.text = 'RAM: ' + total + measureUnit
            ramLabelFree.text = 'Free: ' + free + measureUnit + ','
            ramLabelPercent.text = (free / total * 100 + '').slice(0, 5) +  '%'
            ramDiagram.angle = free / total * Math.PI * 2
        }

        onUpdatePower:
        {
            powerLabel.text = 'Charge: ' + capacity + '%'
            powerDiagram.angle = capacity / 100 * Math.PI * 2
        }
    }

    property int _fontSize : 30

    Row
    {
        spacing: 10
        height: 400

        Column
        {
            width: page.width / 3

            CircleDiagram
            {
                id: cpuDiagram
                width: 200
                height: 200
            }

            Label
            {
                id: cpuLabel
                width: parent.width
                font.pixelSize: page._fontSize
            }
        }

        Column
        {
            width: page.width / 3

            CircleDiagram
            {
                id: ramDiagram
                width: 200
                height: 200
            }

            Label
            {
                id: ramLabelTotal
                width: parent.width
                font.pixelSize: page._fontSize
            }

            Label
            {
                id: ramLabelFree
                width: parent.width
                font.pixelSize: page._fontSize
            }

            Label
            {
                id: ramLabelPercent
                width: parent.width
                font.pixelSize: page._fontSize
            }
        }

        Column
        {
            width: page.width / 3

            CircleDiagram
            {
                id: powerDiagram
                width: 200
                height: 200
            }

            Label
            {
                id: powerLabel
                width: parent.width
                font.pixelSize: page._fontSize
            }
        }
    }

}
