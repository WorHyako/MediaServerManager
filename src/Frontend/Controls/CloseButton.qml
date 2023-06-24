import QtQuick
import QtQuick.Controls
import Frontend.Controls as WorControls

/**
 *  Item root
 *  - var window
 *      | Button
 */
Item {
	id: root

	required property var window

	height: 20
	width: 20

	anchors {
		right: parent.right
		rightMargin: 5
		top: parent.top
		topMargin: 5
	}
	WorControls.Button {
		anchors.fill: parent

		onClicked:()=> {
			window.close();
		}
	}
}
