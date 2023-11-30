import QtQuick
import QtQuick.Controls
import Frontend.Js as WorJs

/**
 * Action, that allow user to change binding to SQL field of data.
 *
 * @author Wor Hyako
 */
Action {
	/**
	 * Management object who call current Action.
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
