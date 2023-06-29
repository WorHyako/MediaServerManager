import QtQuick
import QtQuick.Controls
import Frontend.Js as WorJs

/**
 *  Item root
 *  - int menuBorderRadius: 10
 *  - int menuItemHeight: 50
 *  - int menuItemWidth: 200
 *  - QtObject selectedButton
 *  - int actionTypes: 0
 *  - open()
 *  - enum ActionType { Rename = 0b1, ChangeBindingType = 0b10, Delete = 0b100}
 *      | Menu
 */
Item {
    id: root

    /**
	 * Describe all action types
	 */
    enum ActionType {
        Rename = 1,
        ChangeBindingType,
        Delete = 4
    }

    property int actionTypes: 0
    property int menuBorderRadius: 10
    property int menuItemHeight: 50
    property int menuItemWidth: 200
    required property QtObject selectedButton

    /**
	 * Open menu in current cursor position
	 * @param mousePosition current cursor position
	 */
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
            color: "#B4B4B4"
            implicitHeight: root.menuItemHeight
            implicitWidth: root.menuItemWidth
            radius: root.menuBorderRadius

            border {
                color: "#222"
                width: 2
            }
        }

        Component.onCompleted: {
            const isCreateAllItems = root.actionTypes === 0;
            let actionList = [];
            if ((root.actionTypes & ContextMenu.ActionType.Rename) || isCreateAllItems) {
                actionList.push("Rename");
            }
            if ((root.actionTypes & ContextMenu.ActionType.ChangeBindingType) || isCreateAllItems) {
                actionList.push("ChangeBindingType");
            }
            if ((root.actionTypes & ContextMenu.ActionType.Delete) || isCreateAllItems) {
                actionList.push("Delete");
            }
            for (const eachActionName of actionList) {
                let item = WorJs.ItemCreator.createNewItem(WorJs.ObjectsQrcPath.qrcContextMenu, menu, {
                        "itemText": eachActionName
                    });
                menu.addItem(item);
            }
        }
    }
}
