import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MediaServerManager

/**
 *  Item root
 *      | ManagementButton buttonAddNewButton
 *          | MouseArea
 */
Item {
    id: root
    anchors.fill: parent

    ManagementButton {
        id: buttonAddNewButton
        height: 50
        text: "+"
        width: 50

        MouseArea {
            /**
             * Crete new ManagementButton and attach to root
             * Button will be movable and with circle element
             */
            function createNewButton() {
                var component = Qt.createComponent("ManagementButton.qml");
                var button;
                if (component.status === Component.Ready) {
                    button = component.createObject(root, {
                            "canBeMoved": true,
                            "canBeResized": true,
                            "movableScope": root,
                            "showCircle": true
                        });
                    if (button == null) {
                        console.log("Error on button creating");
                    }
                }
            }

            anchors.fill: parent

            onClicked: {
                createNewButton();
            }
        }
        anchors {
            bottom: parent.bottom
            right: parent.right
        }
    }
}
