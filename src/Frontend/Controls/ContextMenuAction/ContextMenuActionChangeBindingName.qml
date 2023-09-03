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
	required property var selectedObject
	text: "Change binding name"
	onTriggered: () => {
		let window = WorJs.ItemCreator.createNewItem(WorJs.ObjectsQrcPath.qrcChangeBindingWindow,
			selectedObject, {
				"selectedButton": selectedObject
			});
		window.show();
	}
}