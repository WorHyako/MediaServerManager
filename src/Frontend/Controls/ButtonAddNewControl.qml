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
	property var newElementArgs: {
	}

	/**
	 * 	Qrc path of new element
	 */
	required property string qrcElementPath

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

		function addElement(isButton: bool) {
			const rangeCheck = root.scopeObject.children.length < root.maxElementNum;
			if (rangeCheck) {
				if (isButton === undefined) {
					WorJs.ItemCreator.createNewItem(root.qrcElementPath, root.scopeObject, root.newElementArgs);
				} else {
					if (isButton) {
						WorJs.ItemCreator.createNewItem(WorJs.ObjectsQrcPath.qrcManagementButtonWithText, root.scopeObject, root.newElementArgs);
					} else {
						WorJs.ItemCreator.createNewItem(WorJs.ObjectsQrcPath.qrcTable, root.scopeObject, {});
					}
				}
				menu.close();
			}
		}

		Action {
			text: "Default"
			onTriggered: () => {
				menu.addElement();
			}
		}

		Action {
			text: "Add button"
			onTriggered: () => {
				menu.addElement(true);
			}
		}

		Action {
			text: "Add table"
			onTriggered: () => {
				menu.addElement(false);
			}
		}
	}
}
