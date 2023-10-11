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

	text: "Change binding name"

	onTriggered: () => {
		const window = WorJs.ItemCreator.createItem(
			`WorDialogs`,
			`ChangeBindingWindow`,
			`selectedButton: ${selectedObject}`,
			selectedObject,
			`Change binding name window`
		);
		window.show();
	}
}
