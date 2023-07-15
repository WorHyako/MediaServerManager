import QtQuick
import QtQuick.Controls
import Frontend.Js as WorJs
import Frontend.Controls as WorControls

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

	Action {
		text: "Rename"
		onTriggered: () => {
			const dialog = ItemCreator.createNewItem(WorJs.ObjectsQrcPath.qrcRenamingWindow, root, {
				"objectToRename": root.selectedButton,
				"propertyToRename": "text"
			});
			dialog.open();
		}
	}
	Action {
		text: "Change binding name"
		onTriggered: () => {
			let window = WorJs.ItemCreator.createNewItem(WorJs.ObjectsQrcPath.qrcChangeBindingWindow,
				root.selectedButton, {});
			window.show();
		}
	}
	Action {
		text: "Delete"
		onTriggered: () => {
			root.selectedButton.destroy();
		}
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
