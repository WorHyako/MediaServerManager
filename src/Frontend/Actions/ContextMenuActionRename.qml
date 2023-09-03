import QtQuick
import QtQuick.Controls
import Frontend.Js as WorJs

/**
 *
 *
 * ---
 *
 * Action
 */
Action {
	required property string propertyToRename
	required property var objectToRename
	required property var contextMenuRoot

	text: "Rename"

	onTriggered: () => {
		const dialog = WorJs.ItemCreator.createNewItem(WorJs.ObjectsQrcPath.qrcRenamingWindow, contextMenuRoot, {
			"objectToRename": root.selectedButton,
			"propertyToRename": propertyToRename
		});
		dialog.show();
	}
}
