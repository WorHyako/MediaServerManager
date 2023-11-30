import QtQuick
import QtQuick.Controls
import Frontend.Js as WorJs

/**
 * Action, that allow user to change XML message to media server.
 *
 * @author Wor Hyako
 */
Action {
	/**
	 * Management object's property to rename.
	 */
	required property string propertyToRename

	/**
	 * Management object whose property will be renamed.
	 */
	required property var objectToRename

	/**
	 * Hoster (root) of renaming window.
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
