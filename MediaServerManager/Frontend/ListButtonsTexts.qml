import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ManagementButtonStyle 1.0
import TextEditStyle 1.0

/**
 *  Item root
 *      | ColumnLayout linesList
 *          | ManagementButton buttonAddNewLine
 *              | MouseArea
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

            ManagementButton {
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
                        var component = Qt.createComponent("QuickTitleLine.qml");
                        var line;
                        if (component.status === Component.Ready) {
                            line = component.createObject(linesList);
                            if (line == null) {
                                console.log("Error on button creating");
                            }
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
