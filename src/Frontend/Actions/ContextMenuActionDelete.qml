import QtQuick
import QtQuick.Controls

/**
 *
 */
Action {
	/**
	 * Object to destroy
	 */
	required property var objectToDestroy

	text: `Delete`
	onTriggered: () => {
		objectToDestroy.destroy();
	}
}
