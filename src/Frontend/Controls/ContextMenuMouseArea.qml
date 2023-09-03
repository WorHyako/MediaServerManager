import QtQuick
import QtQuick.Controls
import Frontend.Controls as WorControls

MouseArea {
	id: root
	property var selectedButton: undefined
	acceptedButtons: Qt.RightButton
	anchors.fill: parent

	onClicked: {
		if (selectedButton !== undefined)
			contextMenu.open();
	}

	WorControls.ContextMenu {
		id: contextMenu
		selectedButton: root.selectedButton
	}
}
