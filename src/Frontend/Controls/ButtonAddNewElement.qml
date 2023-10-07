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

	Component.onCompleted: {
		root.availableTypes = Qt.binding(function () {
			console.log("in binding:");
			const con = WorGlobal.ManagementControls.getAllControls();
			if (con === undefined || !con.length) {
				return [];
			}
			console.log(con);
			console.log(`controls length ${con.length}`);
			return con;
		});
	}

	/**
	 * Object that will contain new element. New element's parent
	 */
	required property QtObject scopeObject

	/**
	 * All types that button can spawn
	 */
	property var availableTypes

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

	/**
	 * Create new action for context menu with element creating functionality
	 * @param name			Name of element to create
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

	Menu {
		id: menu

		/**
		 * Add to menu all available types and open menu
		 */
		function open() {
			root.availableTypes.forEach((element) => {
				let index = 0;
				/**
				 * Check for elements duplication
				 */
				while (menu.actionAt(index) !== null) {
					console.log("action name: ", menu.actionAt(index).text);
					if (menu.actionAt(index).text === element[0]) {
						return;
					}
					index++;
				}
				root.createAction(element[0], element[1]);
			});
			menu.popup();
		}

		function addElement(controlName: string) {
			console.log(`object name to create: ${controlName}`);
			const item = WorJs.ItemCreator.createItem(
				`WorControls`,
				`${controlName}`,
				``,
				root.scopeObject,
				`ManagementButton`
			);
			menu.close();
		}
	}
}
