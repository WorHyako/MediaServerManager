import QtQuick
import QtQuick.Controls
import Frontend.Js as WorJs
import Frontend.Controls as WorControls
import Frontend.Controls.ContextMenuAction as WorContextAction

/**
 *
 *
 * ---
 *
 *  Menu (root)
 *  - int menuBorderRadius: 10
 *  - int menuItemHeight: 50
 *  - int menuItemWidth: 200
 *  - QtObject selectedButton
 *  - int actionTypes: 0
 *  - open(mousePosition)
 */
Menu {
	id: root

	WorContextAction.ContextMenuActionRename {
		contextMenuRoot: root
		objectToRename: root.selectedButton
		propertyToRename: "buttonText"
	}
	WorContextAction.ContextMenuActionChangeBindingName {
		selectedObject: root.selectedButton
	}
	WorContextAction.ContextMenuActionDelete {
		objectToDestroy: root.selectedButton
	}

	property int actionTypes: 0
	property int menuBorderRadius: 10
	property int menuItemHeight: 50
	property int menuItemWidth: 200
	required property QtObject selectedButton

	/**
	 * Open menu
	 */
	function open() {
		root.popup();
	}

	padding: 3

	delegate: WorControls.ContextMenuItem
	{
		id: menuItem
		itemText: text
	}

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
}
