import QtQuick
import QtQuick.Layouts
import Frontend.Styles as WorStyles
import Frontend.Controls as WorControls
import Frontend.QmlObjects.Command as WorCommands

/**
 *
 *
 * ---
 *
 *  Item (root)
 *  - string objectName: "Management button"
 *  - string bindingEvent: ""
 *  - bool canBeMoved: false
 *  - bool canBeResized: false
 *  - int minButtonHeight: 50
 *  - int minButtonWidth: 50
 *  - Item movableScope: undefined
 *  - var onLeftClicked: undefined
 *  - var onRightClicked: undefined
 *  - string buttonText: "Button"
 *  - string textFieldText: "Text"
 *  | ColumnLayout
 *  	| WorControls.Button (button)
 *  	| WorControls.EditTextField (text)
 *  | WorControls.ContextMenu (contextMenu)
 */
Item {
	id: root
	property string objectName: "Management button"
	property string bindingEvent: ""
	property bool canBeMoved: false
	property bool canBeResized: false
	property var onLeftClicked: undefined
	property var onRightClicked: undefined
	property Item movableScope: undefined
	property string buttonText: "Button"
	property string textFieldText: "Text"
	height: WorStyles.ManagementButtonStyle.managementButtonMediumHeight
	width: WorStyles.ManagementButtonStyle.managementButtonMediumWidth

	QtObject {
		id: internal
		readonly property int minButtonHeight: 50
		readonly property int minButtonWidth: 50
		property var commandPairs: []
	}

	/**
	 *
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
		WorControls.EditTextField {
			id: text
			Layout.preferredHeight: parent.height * 0.3
			Layout.preferredWidth: parent.width
			text: qmlCommandSender.commandText
		}

		WorCommands.QmlCommandSender {
			id: qmlCommandSender
		}
	}
}
