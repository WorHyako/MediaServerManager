import QtQuick
import QtQuick.Controls
import "qrc:/Backgrounds" as CustomBackgrounds
import "qrc:/Widgets" as CustomWidgets
import "qrc:/JS/ItemCreator.js" as ItemCreator
import "qrc:/JS/Renamer.js" as Renamer

/**
 *  Item root
 *  - int menuBorderRadius: 10
 *  - int menuItemHeight: 50
 *  - int menuItemWidth: 200
 *  - QtObject selectedButton
 *  - open()
 *  - renameApplied(text)
 *      | Menu
 *      - Action text: {"Rename"}, {"Change Binding name"}
 */
Item {
    id: root

    property int menuBorderRadius: 10
    property int menuItemHeight: 50
    property int menuItemWidth: 200
    property QtObject selectedButton

    /**
     * Open menu in current cursor position
     * @param mousePosition current cursor position
     */
    function open(mousePosition) {
        menu.x = mousePosition.x;
        menu.y = mousePosition.y;
        menu.open();
    }

    /**
     * Function exist just by one reason
     * I can't find how to return data via onAccepted or onApplied Dialog's event
     * @param text  New text
     */
    function renameApplied(text) {
        console.log("---new text", text);
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

            onClicked: {
                if (menuItem.text === "Rename") {
                    const dialog = ItemCreator.createNewItem("qrc:/Widgets/RenamingDialog.qml", root, {
                            "previousText": "previous name",
                            "id": "renamingDialog"
                        });
                    // dialog.accepted.connect(renameApplied);
                    dialog.open();
                } else {
                    if (menuItem.text === "Change Binding name") {
                    }
                }
            }
        }

        Action {
            id: renaming
            text: "Rename"
        }
        Action {
            id: changeBinding
            text: "Change Binding name"
        }
    }
}
