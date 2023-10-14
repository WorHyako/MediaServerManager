import QtQuick
import QtQuick.Controls
import Frontend.Js as WorJs

/**
 *
 */
Action {
	/**
	 * Object's property to rename
	 */
	required property string propertyToRename

	/**
	 * Object, that property will be renamed
	 */
	required property var objectToRename

	/**
	 * Parent (root) of renaming window
	 */
	required property var contextMenuRoot

	text: `Rename`

	onTriggered: () => {
		const dialog = WorJs.ItemCreator.createItem(
			`WorDialogs`,
			`RenamingDialog`,
			``,
			contextMenuRoot,
			`RenamingDialog`
		);
		dialog.objectToRename = objectToRename;
		dialog.propertyToRename = propertyToRename;
		dialog.show();
	}
}
