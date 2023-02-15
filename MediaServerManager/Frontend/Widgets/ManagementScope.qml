import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MediaServerManager
import "qrc:/Controls" as CustomControls
import "qrc:/JS/itemCreator.js" as ItemCreator

/**
 *  Item root
 *      | ManagementButton buttonAddNewButton
 *          | MouseArea
 */
Item {
    id: root
    anchors.fill: parent

    CustomControls.ManagementButton {
        id: buttonAddNewButton
        height: 50
        text: "+"
        width: 50

        MouseArea {
            anchors.fill: parent

            onClicked: {
                ItemCreator.createNewItem("qrc:/Controls/ManagementButton.qml", root, {
                        "canBeMoved": true,
                        "canBeResized": true,
                        "movableScope": root,
                        "showCircle": true
                    });
            }
        }
        anchors {
            bottom: parent.bottom
            right: parent.right
        }
    }
}
