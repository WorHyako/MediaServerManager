import QtQuick
import QtQuick.Controls
import Frontend.Controls as WorControls
import Frontend.Actions as WorActions

/**
 *
 */
Menu {
	id: root

	WorActions.ContextMenuActionRename {
		contextMenuRoot: root
		objectToRename: root.selectedButton
		propertyToRename: `buttonText`
	}

	WorActions.ContextMenuActionChangeBindingName {
		selectedObject: root.selectedButton
	}

	WorActions.ContextMenuActionDelete {
		objectToDestroy: root.selectedButton
	}

	property int actionTypes: 0

	/**
	 * Context menu's border radius
	 */
	property int menuBorderRadius: 10

	/**
	 * Context menu item's height
	 */
	property int menuItemHeight: 50

	/**
	 * Context menu item's width
	 */
	property int menuItemWidth: 200

	/**
	 * Button that contain menu
	 */
	required property QtObject selectedButton

	padding: 3

	delegate: WorControls.ContextMenuItem
	{
		id: menuItem
		itemText: text
	}

	background: Rectangle {
		color: `#B4B4B4`
		implicitHeight: root.menuItemHeight
		implicitWidth: root.menuItemWidth
		radius: root.menuBorderRadius

		border {
			color: `#222`
			width: 2
		}
	}
}
