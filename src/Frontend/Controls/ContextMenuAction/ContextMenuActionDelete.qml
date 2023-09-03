import QtQuick
import QtQuick.Controls

/**
 *
 *
 * ---
 *
 * Action
 */
Action {
	required property var objectToDestroy

	text: "Delete"
	onTriggered: () => {
		objectToDestroy.destroy();
	}
}
