import QtQuick
import QtQuick.Controls
import Frontend.Js as WorJs

/**
 *
 */
Action {
	/**
	 * Object to change XML message to media server
	 */
	required property var selectedObject

	text: `Change xml message`

	onTriggered: () => {
		const window = WorJs.ItemCreator.createItem(
			`WorDialogs`,
			`ChangeXmlMessageWindow`,
			``,
			selectedObject,
			`Change xml message window`
		);
		window.selectedButton = selectedObject;
		console.log(`selected object: ${selectedObject}`);
		window.open();
	}
}
