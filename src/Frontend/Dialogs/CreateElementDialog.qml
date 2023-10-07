import QtQuick
import Frontend.Controls as WorControls
import Frontend.Js as WorJs
import Frontend.Backgrounds as WorBackgrounds
import Frontend.Global as WorGlobal

/**
 *
 */
Window {
	id: root
	width: 300
	height: 250
	minimumHeight: 250
	minimumWidth: 300

	/**
	 * New created element
	 */
	property var newElement: undefined

	WorBackgrounds.ButtonBackgroundRectangle {
		id: elementScope
		width: 300
		height: 200
		anchors {
			horizontalCenter: parent.horizontalCenter
			top: parent.top
		}
	}

	WorControls.ButtonAddNewElement {
		scopeObject: elementScope
	}

	WorControls.EditTextField {
		id: controlName

		anchors {
			horizontalCenter: parent.horizontalCenter
			bottom: parent.bottom
		}
	}

	WorControls.Button {
		width: 50
		height: 30
		anchors {
			left: parent.left
			bottom: parent.bottom
		}
		text: "Save"
		onLeftClicked: () => {
			root.newElement = elementScope;
			WorGlobal.ManagementControls.addControl(root.newElement, controlName.text);
			root.close();
			root.destroy();
		}
	}
}
