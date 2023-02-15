import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "qrc:/JS/itemCreator.js" as ItemCreator

/**
 *  Item root
 *  - var keys: ["1", "2", "3", "QTY", "4", "6", "5", "Disc", "7", "8", "9", "Price", "+/-", "0", ".", "<="]
 *      | GridView grid
 *      - int columns: 4
 *      - int rows: 4
 *          | Rectangle
 *              | Text
 */
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

        Button {
            height: 50
            width: 50

            background: Rectangle {
                anchors.fill: parent
                color: "#0a0"
            }

            onClicked: {
                ItemCreator.createNewItem();
            }
        }
    }
}
