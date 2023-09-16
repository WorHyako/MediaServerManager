import QtQuick
import QtQuick.Controls
import Frontend.Controls as WorControls
import Frontend.Backgrounds as WorBackgrounds

/**
 *
 * ---
 *
 */
Window {
	id: root

	WorBackgrounds.ButtonBackgroundRectangle {
		id: elementScope
		width: 300
		height: 200
		anchors {
			verticalCenter: parent.verticalCanter
			horizontalCenter: parent.horizontalCenter
		}
	}

	WorControls.ButtonAddNewElement {
		scopeObject: elementScope
	}
}
