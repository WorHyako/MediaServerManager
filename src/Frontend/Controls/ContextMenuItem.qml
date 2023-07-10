import QtQuick
import QtQuick.Controls
import Frontend.Controls as WorControls
import Frontend.Widgets as WorWidgets

/**
 *
 *
 * ---
 *
 * MenuItem (root)
 * string itemText
 */
MenuItem {
	id: root

	property var triggeredAction: () => {
	}
	required property string itemText

	background: Rectangle {
		anchors.fill: parent
		color: root.highlighted ? "#555" : "transparent"
		radius: 8
	}
	contentItem: WorControls.Text
	{
		id: rootText

		color: root.highlighted ? "#fff" : "#000"
		horizontalAlignment: Text.AlignLeft
		text: itemText
	}

	onTriggered: {
		root.triggeredAction();
		//     if (root.text === "Rename") {
		//         const dialog = ItemCreator.createNewItem(WorWidgets.RenamingDialog, root, {
		//                 "objectToRename": selectedButton,
		//                 "propertyToRename": "text"
		//             });
		//         dialog.open();
		//         return;
		//     }
		//     if (root.text === "Change Binding name") {
		//         return;
		//     }
		//     if (root.text === "Delete") {
		//         selectedButton.destroy();
		//         return;
		//     }
	}
}
