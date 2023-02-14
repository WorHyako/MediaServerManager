import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root

    property var keys: ["1", "2", "3", "QTY", "4", "6", "5", "Disc", "7", "8", "9", "Price", "+/-", "0", ".", "<="]

    height: 500
    width: 500

    GridView {
        id: grid

        readonly property int columns: 4
        readonly property int rows: 4

        anchors.fill: parent
        cellHeight: height / rows
        cellWidth: width / columns
        model: keys

        delegate: Rectangle {
            height: grid.cellHeight
            width: grid.cellWidth

            Text {
                text: keys[index]
            }
        }
    }
}