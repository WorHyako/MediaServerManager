import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MediaServerManager

/**
 *  Item : root
 *      | ManagementButton : buttonAddNewButton
 */
Item {
    id: root
    anchors.fill: parent

    ManagementButton {
        // anchors.centerIn: parent
        canBeMoved: true
        movableScope: root
    }
    ManagementButton {
        id: buttonAddNewButton
        height: 50
        text: "+"
        width: 50

        MouseArea {
            function createNewButton() {
                var someComponent = Qt.createComponent("ManagementButton.qml");
                var button;
                if (someComponent.status === Component.Ready) {
                    button = someComponent.createObject(root, {
                            "canBeMoved": true,
                            "movableScope": root,
                            "showCircle": true
                        });
                    if (button == null) {
                        console.log("Error on button creating");
                    }
                    console.log(button.movableScope);
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
