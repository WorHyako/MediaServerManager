import QtQuick
import Frontend.Controls as WorControls
import Frontend.ManagementControls as WorManagementControls

/**
 *
 */
WorControls.EditTextField {
	id: root

	/**
	 * Is button can be moved in dynamic scope
	 */
	property bool canBeMoved: false

	/**
	 * Is button can be resized in dynamic scope
	 */
	property bool canBeResized: false

	/**
	 * Scope, where button can move and resize
	 */
	property Item movableScope: undefined

	WorManagementControls.TransformMouseArea {
		canBeMoved: root.canBeMoved
		target: root
		canBeResized: root.canBeResized
		movableScope: root.movableScope
		onLeftClicked: () => {
			root.setFocus();
		}
	}

	WorControls.ContextMenuMouseArea {
		selectedButton: root
	}
}
