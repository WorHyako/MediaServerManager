import QtQuick
import QtQuick.Controls
import Frontend.Js as WorJs

/**
 *
 */
Action {
	/**
	 * Object to change binding to Sql field
	 */
	required property var selectedObject

	text: `Change binding name`

	onTriggered: () => {
		const window = WorJs.ItemCreator.createItem(
			`WorDialogs`,
			`ChangeSqlBindingWindow`,
			``,
			selectedObject,
			`Change binding name window`
		);
		window.selectedButton = selectedObject;
		window.show();
	}
}
