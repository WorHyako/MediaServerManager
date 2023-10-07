import QtQuick
import QtQuick.Layouts
import Frontend.Styles as WorStyles
import Frontend.Controls as WorControls
import Frontend.QmlObjects.Command as WorCommands

/**
 *
 */
WorControls.ManagementButton {
	id: root

	Component.onCompleted: {
		height = height * 0.7
	}
	/**
	 * Text inside Edit Text field
	 */
	property string textFieldText: "Text"

	WorControls.EditTextField {
		id: text
		height: root.height * 0.5
		anchors {
			top: parent.bottom
			topMargin: 3
			left: parent.left
			right: parent.right
		}
		text: qmlCommandSender.commandText
	}
}
