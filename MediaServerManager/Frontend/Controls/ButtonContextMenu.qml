import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/**
 *  Item root
 *  - open()
 *      | Menu menu
 *          | Repeater
 *              | MenuItem
 */
Item {
    id: root
    function open(mousePosition) {
        menu.x = mousePosition.x;
        menu.y = mousePosition.y;
        menu.open();
    }

    anchors.fill: parent

    Menu {
        id: menu
        Repeater {
            model: ["Rename", "Change binding name"]

            MenuItem {
                text: modelData

                background: Rectangle {
                    anchors.fill: parent
                    color: "#ccc"
                    radius: 1
                }
            }
        }
    }
}
