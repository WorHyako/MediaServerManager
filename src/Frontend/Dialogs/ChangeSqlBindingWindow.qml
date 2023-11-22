import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQml.Models
import Frontend.Controls as WorControls

/**
 *
 */
Window {
	id: root

	height: 300
	width: 500

	modality: Qt.ApplicationModal

	/**
	 * Object to change this one binding text
	 */
	property QtObject selectedButton: undefined

	WorControls.EditTextField {
		id: textEdit
		text: root.selectedButton.sqlDataName
	}

	WorControls.Button {
		id: applyButton

		height: 50
		width: 50

		anchors {
			right: parent.right
			bottom: parent.bottom
		}
		onLeftClicked: () => {
			root.close();
			root.selectedButton.sqlDataName = textEdit.text;
			root.destroy();
		}
	}
}
