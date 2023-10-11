import QtQuick
import QtQuick.Controls
import Frontend.Controls as WorControls
import Frontend.Js as WorJs
import Frontend.Global as WorGlobal

/**
 * Object based on WorControls.Button to create new elements
 */
WorControls.Button {
	id: root

	/**
	 * 	Max element number, which button can spawn
	 */
	property int maxElementNum

	/**
	 * 	Arguments to new element
	 */
	property var newElementArgs: ``

	/**
	 * Object that will contain new control. New control's parent
	 */
	required property QtObject scopeObject

	height: 50
	text: "Add"
	width: 50

	onLeftClicked: () => {
		menu.open();
	}

	anchors {
		bottom: parent.bottom
		right: parent.right
	}

	Menu {
		id: menu

		/**
		 * Create new action for context menu with element creating functionality
		 * @param name	Name of element to create
		 */
		function createAction(name: string) {
			const args = `text: "${name}"
			onTriggered: () => {
				menu.addElement("${name}");
			}`;
			const action = WorJs.ItemCreator.createItem(
				`QtQuick.Controls`,
				`Action`,
				args,
				menu, `${name}_Action`);
			menu.addAction(action);
		}
		/**
		 *
		 */
		function open() {
			menu.cleanActions();
			const availableTypes = WorGlobal.ManagementControls.getAllControls();
			availableTypes.forEach((element) => {
				menu.createAction(element.name);
				console.log(`action ${element.name} was added`);
			});
			menu.popup();
		}

		/**
		 * Cleaning current actions from menu
		 */
		function cleanActions() {
			for (let index = menu.count; index >= 0; --index) {
				menu.takeAction(index);
			}
		}

		/**
		 *
		 * @param name
		 * @param args
		 */
		function addElement(name: string, args = ``) {
			const rangeCheck = root.scopeObject.children.length < root.maxElementNum;
			if (!rangeCheck) {
				return;
			}

			const element = WorJs.ItemCreator.createItem(
				`WorControls`,
				`${name}`,
				args,
				root.scopeObject,
				`${name}`
			);
			element.movableScope = root.scopeObject;
			menu.close();
		}
	}
}
