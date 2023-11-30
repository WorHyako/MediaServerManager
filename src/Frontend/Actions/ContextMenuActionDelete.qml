import QtQuick
import QtQuick.Controls

/**
 * Action, that allow user to delete selected management object.
 *
 * @author Wor Hyako
 */
Action {
	/**
	 * Management object to destroy.
	 */
	required property var objectToDestroy

	text: `Delete`

	onTriggered: () => {
		objectToDestroy.destroy();
	}
}
