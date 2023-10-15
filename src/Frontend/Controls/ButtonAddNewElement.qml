import QtQuick
import QtQuick.Controls
import Frontend.Controls as WorControls
import Frontend.Global as WorGlobal
import Frontend.Js as WorJs

/**
 * Object based on WorControls.Button to create new elements
 */
WorControls.Button {
	id: root

	/**
	 * Object that will contain new element. New element's parent
	 */
	required property QtObject scopeObject

	/**
	 * List of element for current control
	 * Contains vars via [{stringifyObject}, {...}, ...]
	 */
	property var currentControlElements: []

	height: 50
	text: `Add`
	width: 50

	onLeftClicked: () => {
		menu.open();
	}

	anchors {
		bottom: parent.bottom
		right: parent.right
	}

	/**
	 * Reset all data for current element
	 */
	function reset() {
		root.currentControlElements = [];
		menu.cleanActions();
	}

	Menu {
		id: menu

		/**
		 * Create new action for context menu with element creating functionality
		 * @param name	Name of element to create
		 */
		function createAction(name: string) {
			const args = `text: \`${name}\`
			onTriggered: () => {
				menu.addElement(\`${name}\`);
			}`;
			const action = WorJs.ItemCreator.createItem(
				`QtQuick.Controls`,
				`Action`,
				args,
				menu, `${name}_Action`);
			menu.addAction(action);
		}

		/**
		 * Add to menu all available types and open menu
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
		 *
		 * @param controlName
		 */
		function addElement(controlName: string) {
			console.log(`object name to create: ${controlName}`);
			const element = WorJs.ItemCreator.createItem(
				`WorManagementControls`,
				`${controlName}`,
				`canBeMoved: true
				 canBeResized: true`,
				root.scopeObject,
				`${controlName}`
			);
			element.movableScope = root.scopeObject;
			const stringifyView = WorJs.ItemCreator.getStringifyObject(
				`WorManagementControls`,
				`${controlName}`,
				`canBeMoved: true
				canBeResized: true`,
				root.scopeObject,
				`${controlName}`);
			root.currentControlElements.push(stringifyView);
			menu.close();
		}

		/**
		 * Cleaning current actions from menu
		 */
		function cleanActions() {
			for (let index = menu.count; index >= 0; --index) {
				menu.takeAction(index);
			}
		}
	}
}
