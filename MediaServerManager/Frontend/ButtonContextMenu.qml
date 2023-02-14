import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/**
 *  Item root
 *  - open()
 *      | Menu menu
 *          | MenuItem
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
        MenuItem {
            text: "Rename"
            background: Rectangle{
                anchors.fill: parent
                color: "#000"
                radius: 10
            }
        }
        MenuItem {
            text: "Change binding name"
        }
    }
}
