import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "qrc:/Styles" as Styles
import "qrc:/Controls" as CustomControls

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
                    /**
                    *  Create new line and attach it to linesList
                    */
                    function createNewLine() {
                        var component = Qt.createComponent("qrc:/Controls/QuickTitleLine.qml");
                        var line;
                        if (component.status === Component.Ready) {
                            line = component.createObject(linesList);
                            if (line == null) {
                                console.log("Error on button creating");
                            }
                        } else {
                            console.log("(ListButtonTexts)Error string: " + component.errorString());
                        }
                    }

                    acceptedButtons: Qt.LeftButton
                    anchors.fill: parent

                    onClicked: {
                        createNewLine();
                    }
                }
            }
        }
    }
}