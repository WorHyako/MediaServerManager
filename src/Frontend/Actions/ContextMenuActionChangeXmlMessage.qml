import QtQuick
import QtQuick.Controls
import Frontend.Js as WorJs

/**
 * Action, that allow user to change selected management object's XML message to media server.
 *
 * @author Wor Hyako
 */
Action {
	/**
	 * Management object, who call current Action.
	 */
	required property var selectedObject

	text: `Change xml message`

	onTriggered: () => {
		const dialog = WorJs.ItemCreator.createItem(
			`WorDialogs`,
			`ChangeXmlMessageWindow`,
			``,
			selectedObject,
			`Change xml message window`
		);
		dialog.selectedButton = selectedObject;
		console.log(`selected object: ${selectedObject}`);
		dialog.open();
	}
}
