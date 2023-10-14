import QtQuick
import Frontend.Backgrounds as WorBackgrounds
import Frontend.Controls as WorControls

/**
 * Object to describe base class Button with left\right click events
 * Button has context menu and internal text field
 */
WorBackgrounds.ButtonBackgroundRectangle {
	id: root

	/**
	 *	Context menu visibility
	 */
	property bool contextMenuEnable: true

	/**
	 * 	Event on mouse left click
	 */
	property var onLeftClicked: undefined

	/**
	 * 	Event on mouse right click
	 */
	property var onRightClicked: undefined

	/**
	 * 	Non-editable text inside button's body
	 */
	property string text: ``

	/**
	 * Imitate mouse left click
	 */
	function leftClick() {
		leftClickArea.clicked(Qt.MouseEvent);
	}

	/**
	 * Imitate mouse right click
	 */
	function rightClick() {
		rightClickArea.clicked(Qt.MouseEvent);
	}

	hoveredCondition: leftClickArea.containsMouse

	/**
	 * 	Non-editable text inside button's body
	 */
	WorControls.Text {
		anchors.centerIn: parent
		opacity: enabled ? 1.0 : 0.3
		text: root.text
	}

	MouseArea {
		id: rightClickArea

		acceptedButtons: Qt.RightButton
		anchors.fill: parent
		hoverEnabled: true

		onClicked: (mouse) => {
			if (root.onRightClicked !== undefined) {
				root.onRightClicked();
			}
		}
	}

	MouseArea {
		id: leftClickArea

		hoverEnabled: true
		acceptedButtons: Qt.LeftButton
		anchors.fill: parent

		onClicked: {
			console.log(`Button has been clicked.`);
			if (root.onLeftClicked !== undefined) {
				root.onLeftClicked();
			}
		}
	}
}
