import QtQuick
import QtQuick.Layouts
import Frontend.Styles as WorStyles
import Frontend.Controls as WorControls
import Frontend.ManagementControls as WorManagementControls
import Frontend.QmlObjects.Command as WorCommands

/**
 *
 */
Item {
	id: root

	property Item commandManagerRef: commandManager

	/**
	 * Object's name
	 */
	property string objectName: `Management button with text`


	/**
	 * Is button can be moved in dynamic scope
	 */
	property bool canBeMoved: false

	/**
	 * Is button can be resized in dynamic scope
	 */
	property bool canBeResized: false

	/**
	 * Event on mouse left click
	 */
	property var onLeftClicked: undefined

	/**
	 * Event on mouse right click
	 */
	property var onRightClicked: undefined

	/**
	 * Scope, where button can move and resize
	 */
	property Item movableScope: undefined

	/**
	 * Text inside button body
	 */
	property string buttonText: `Button`

	/**
	 * Text inside Edit Text field
	 */
	property string textFieldText: `Text`

	height: WorStyles.ManagementButtonStyle.managementButtonMediumHeight
	width: WorStyles.ManagementButtonStyle.managementButtonMediumWidth

	/**
	 * Private variables and objects
	 */
	QtObject {
		id: internal

		/**
		 * Button's minimal height
		 */
		readonly property int minButtonHeight: 50

		/**
		 * Button's minimal width
		 */
		readonly property int minButtonWidth: 50
	}

	ColumnLayout {
		spacing: 3
		anchors.fill: parent

		WorControls.Button {
			id: button
			text: root.buttonText
			Layout.preferredHeight: parent.height * 0.8
			Layout.preferredWidth: parent.width
			onRightClicked: root.onRightClicked
			onLeftClicked: root.onLeftClicked

			WorManagementControls.TransformMouseArea {
				canBeMoved: root.canBeMoved
				target: root
				canBeResized: root.canBeResized
				movableScope: root.movableScope
				onLeftClicked: () => {
					commandManager.sendCommand();
					button.leftClick();
				}
			}

			WorControls.ContextMenuMouseArea {
				selectedButton: root
			}
		}

		WorControls.EditTextField {
			id: text
			Layout.preferredHeight: parent.height * 0.3
			Layout.preferredWidth: parent.width
			text: commandManager.bindingEvent
		}

		WorManagementControls.CommandPairs {
			id: commandManager
		}
	}
}