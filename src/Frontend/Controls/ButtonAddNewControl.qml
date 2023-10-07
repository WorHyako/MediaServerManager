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

		function addElement(name: string, args = ``) {
			const rangeCheck = root.scopeObject.children.length < root.maxElementNum;
			if (!rangeCheck) {
				return;
			}

			WorJs.ItemCreator.createItem(
				`WorControls`,
				`${name}`,
				`${args}`,
				root.scopeObject,
				`${name}`
			);
			menu.close();
		}

		Action {
			text: "Default"
			onTriggered: () => {
				menu.addElement(`ManagementButton`, root.newElementArgs);
			}
		}

		Action {
			text: "Add button"
			onTriggered: () => {
				menu.addElement(`ManagementButton`, root.newElementArgs);
			}
		}

		Action {
			text: "Add table"
			onTriggered: () => {
				menu.addElement(`Table`);
			}
		}
	}
}
