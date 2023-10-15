import QtQuick
import Frontend.Controls as WorControls
import Frontend.ManagementControls as WorManagementControls

/**
 *
 */
Item {
	id: root

	/**
	 * Object name
	 */
	property string objectName: `Management button`

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

	height: 50
	width: 100

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

	WorControls.Button {
		id: button
		text: root.buttonText
		anchors.fill: parent
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

		WorManagementControls.CommandPairs {
			id: commandManager
		}
	}
}
