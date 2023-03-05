import QtQuick
import QtQuick.Controls
import "qrc:/Backgrounds" as CustomBackgrounds

/**
 *  Item root
 *  - open()
 *      | Menu
 *      - Action text: {"Rename"}, {"Change Binding name"}
 */
Item {
    id: root

    property int menuItemHeight: 50
    property int menuItemWidth: 200
    property int menuBorderRadius: 10

    function open(mousePosition) {
        menu.x = mousePosition.x;
        menu.y = mousePosition.y;
        menu.open();
    }

    anchors.fill: parent

    Menu {
        id: menu
        padding: 3

        background: Rectangle {
            border.color: "#222"
            border.width: 2
            color: "#B4B4B4"
            implicitHeight: menuItemHeight
            implicitWidth: menuItemWidth
            radius: menuBorderRadius
        }
        delegate: MenuItem {
            id: menuItem
            background: Rectangle {
                anchors.fill: parent
                color: menuItem.highlighted ? "#555" : "transparent"
                radius: 8
            }
            contentItem: Text {
                id: menuItemText
                color: menuItem.highlighted ? "#fff" : "#000"
                horizontalAlignment: Text.AlignLeft
                text: menuItem.text
                verticalAlignment: Text.AlignVCenter
            }
        }

        Action {
            text: "Rename"
        }
        Action {
            text: "Change Binding name"
        }
    }
}
