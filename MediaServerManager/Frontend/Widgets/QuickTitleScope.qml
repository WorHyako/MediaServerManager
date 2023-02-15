import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "qrc:/Styles" as Styles
import "qrc:/Controls" as CustomControls
import "qrc:/JS/itemCreator.js" as ItemCreator

/**
 *  Item root
 *      | ColumnLayout linesList
 *          | ManagementButton buttonAddNewLine
 *              | MouseArea
 *              - createNewLine()
 */
Item {
    id: root
    Rectangle {
        anchors.fill: parent
        /**
         *  Color Blue, but alpha - 0 to set Rectangle invisible
         */
        color: "#000000ff"
        radius: 10

        border {
            color: "#AAA"
            width: 1
        }
        ColumnLayout {
            id: linesList
            anchors.top: parent.top
            spacing: 50

            CustomControls.ManagementButton {
                id: buttonAddNewLine
                Layout.column: 0
                Layout.row: 0
                height: 50
                text: "+"
                width: 50

                MouseArea {
                    acceptedButtons: Qt.LeftButton
                    anchors.fill: parent

                    onClicked: {
                        ItemCreator.createNewItem("qrc:/Controls/QuickTitleLine.qml", linesList);
                    }
                }
            }
        }
    }
}
