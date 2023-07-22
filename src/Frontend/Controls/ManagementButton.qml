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
 *  		| MouseArea transformMouseArea
 *  		- numInRange(num, min, max)
 *  		- point lastButtonSize: null
 *  		- point lastMousePosition: null
 *  		- bool resizing: false
 *  		- bool moving: false
 *  	| WorControls.EditTextField (text)
 *  | WorControls.ContextMenu (contextMenu)
 */
Item {
	id: root
	property string objectName: "Management button"
	property string bindingEvent: ""
	property bool canBeMoved: false
	property bool canBeResized: false
	readonly property int minButtonHeight: 50
	readonly property int minButtonWidth: 50
	property var onLeftClicked: undefined
	property var onRightClicked: undefined
	property Item movableScope: undefined
	property string buttonText: "Button"
	property string textFieldText: "Text"
	height: WorStyles.ManagementButtonStyle.managementButtonMediumHeight
	width: WorStyles.ManagementButtonStyle.managementButtonMediumWidth

	/**
	 *
	 * @param commandPairs
	 * @returns {boolean}
	 */
	function makeCommand(commandPairs): boolean {
		if (!(Array.isArray(commandPairs) && Array.isArray(commandPairs[0]))) {
			return false;
		}
		commandPairs.forEach((pair) => {
			console.log(pair);
		});
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

			MouseArea {
				id: transformMouseArea

				property point lastButtonSize: Qt.point(0, 0)
				property point lastMousePosition: Qt.point(0, 0)
				property bool moving: false
				property bool resizing: false

				/**
				 * Return num with min\max limit conditions
				 * @param num number
				 * @param min minimum limit
				 * @param max maximum limit
				 */
				function numInRange(num: int, min: int, max: int): int {
					let result = num;
					if (num < min) {
						result = min;
					} else {
						if (num > max) {
							result = max;
						}
					}
					return result;
				}

				acceptedButtons: Qt.LeftButton
				anchors.fill: parent

				onClicked: {
					qmlCommandSender.sendCommand();
					button.leftClick();
				}
				onPositionChanged: mouse => {
					if (resizing) {
						if (lastMousePosition === Qt.point(0, 0)) {
							lastMousePosition = mapToItem(root.movableScope, mouse.x, mouse.y);
							return;
						}
						const currentMousePosition = mapToItem(root.movableScope, mouse.x, mouse.y);
						const deltaMousePosition = Qt.point(0, 0);
						deltaMousePosition.x = currentMousePosition.x - lastMousePosition.x;
						deltaMousePosition.y = currentMousePosition.y - lastMousePosition.y;
						const minWidth = 50
						const minHeight = 50
						const newWidth = numInRange(lastButtonSize.x + deltaMousePosition.x, root.minButtonWidth, root.movableScope.width);
						const newHeight = numInRange(lastButtonSize.y + deltaMousePosition.y, root.minButtonHeight, root.movableScope.height);
						root.width = newWidth < minWidth ? minWidth : newWidth;
						root.height = newHeight < minHeight ? minHeight : newHeight;
					}
				}
				onPressed: mouse => {
					resizing = root.canBeResized && (mouse.modifiers & Qt.AltModifier);
					moving = root.canBeMoved && (mouse.modifiers & Qt.ControlModifier);
					lastButtonSize.x = root.width;
					lastButtonSize.y = root.height;
				}
				onReleased: {
					resizing = false;
					moving = false;
					lastMousePosition = Qt.point(0, 0);
				}

				drag {
					axis: Drag.XandYAxis
					maximumX: root.movableScope.width - root.width
					maximumY: root.movableScope.height - root.height
					minimumX: 0
					minimumY: 0
					target: transformMouseArea.moving ? root : null
				}
			}
			MouseArea {
				id: contextMouseArea
				acceptedButtons: Qt.RightButton
				anchors.fill: parent
				onClicked: {
					contextMenu.open();
				}
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
	WorControls.ContextMenu {
		id: contextMenu
		selectedButton: root
	}
}
