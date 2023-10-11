import QtQuick
import QtQuick.Controls
import Frontend.Controls as WorControls

/**
 *
 */
MouseArea {
	id: root

	/**
	 * Button that contain current mouse area
	 */
	property var selectedButton: undefined

	acceptedButtons: Qt.RightButton

	anchors.fill: parent

	onClicked: {
		if (selectedButton !== undefined)
			contextMenu.popup();
	}

	WorControls.ContextMenu {
		id: contextMenu
		selectedButton: root.selectedButton
	}
}
