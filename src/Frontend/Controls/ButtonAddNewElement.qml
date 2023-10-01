import QtQuick
import QtQuick.Controls
import Frontend.Controls as WorControls
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
	 * All types that button can spawn
	 */
	property var availableTypes: [
		["Management button", WorJs.ObjectsQrcPath.qrcManagementButton],
		["Management button with text", WorJs.ObjectsQrcPath.qrcManagementButtonWithText],
		["Table", WorJs.ObjectsQrcPath.qrcTable]
	]

	height: 50
	text: "Add"
	width: 50

	onLeftClicked: () => {
		menu.open();
	}

	QtObject {
		id: internal
	}

	anchors {
		bottom: parent.bottom
		right: parent.right
	}

	function createAction(name: string, qrcPath: string) {
		const action = Qt.createQmlObject(
			`import QtQuick;
			import QtQuick.Controls;
			Action {
				text: "${name}"
				onTriggered: () => {
					menu.addElement("${qrcPath}");
				}
			}`,
			menu, `shitAction`);
		menu.addAction(action);
	}

	Menu {
		id: menu

		function addElement(qrcPath: string) {
			WorJs.ItemCreator.createNewItem(qrcPath, root.scopeObject, {
				"canBeMoved": true,
				"canBeResized": true,
				"movableScope": root.scopeObject
			});
			menu.close();
		}

		Component.onCompleted: {
			root.availableTypes.forEach((element) => {
				root.createAction(element[0], element[1]);
			});
		}
	}
}
