import QtQuick
import QtQuick.Layouts
import Frontend.Styles as WorStyles
import Frontend.Controls as WorControls
import Frontend.QmlObjects.Command as WorCommands

/**
 *
 */
Item {
	id: root

	/**
	 * Object name
	 */
	property string objectName: "Management button"

	/**
	 * XML command to send to media manager
	 */
	property string bindingEvent: ""

	/**
	 * Is button can be moved in dynamic scope
	 */
	property bool canBeMoved: false

	/**
	 * Is button can be resized in dynamic scope
	 */
	property bool canBeResized: false

	property var onLeftClicked: undefined
	property var onRightClicked: undefined

	/**
	 * Scope, where button can move and resize
	 */
	property Item movableScope: undefined

	/**
	 * Text inside button body
	 */
	property string buttonText: "Button"

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

		/**
		 * Pairs to generate XML message to media serve
		 */
		property var commandPairs: []
	}

	/**
	 * Return command pairs
	 */
	function getCommandPairs() {
		return internal.commandPairs;
	}

	/**
	 *
	 * @param commandPairs
	 * @returns {boolean}
	 */
	function makeCommand(commandPairs): boolean {
		if (!(Array.isArray(commandPairs) && Array.isArray(commandPairs[0]))) {
			return false;
		}
		internal.commandPairs = commandPairs;
		const makingResult = qmlCommandSender.makeCommand(commandPairs);
		return makingResult;
	}

	WorControls.Button {
		id: button
		text: root.buttonText
		anchors.fill: parent
		onRightClicked: root.onRightClicked
		onLeftClicked: root.onLeftClicked

		WorControls.TransformMouseArea {
			canBeMoved: root.canBeMoved
			target: root
			canBeResized: root.canBeResized
			movableScope: root.movableScope
			onLeftClicked: () => {
				qmlCommandSender.sendCommand();
				button.leftClick();
			}
		}

		WorControls.ContextMenuMouseArea {
			selectedButton: root
		}
	}

	WorCommands.QmlCommandSender {
		id: qmlCommandSender
	}
}
