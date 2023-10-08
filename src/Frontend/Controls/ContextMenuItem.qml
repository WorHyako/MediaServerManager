import QtQuick
import QtQuick.Controls
import Frontend.Controls as WorControls

/**
 *
 */
MenuItem {
	id: root

	/**
	 * Triggered action on mouse click
	 */
	property var triggeredAction: () => {
	}

	/**
	 * Menu item's shown text
	 */
	required property string itemText

	background: Rectangle {
		anchors.fill: parent
		color: root.highlighted ? "#555" : "transparent"
		radius: 8
	}

	contentItem: WorControls.Text
	{
		id: rootText

		color: root.highlighted ? "#fff" : "#000"
		horizontalAlignment: Text.AlignLeft
		text: itemText
	}

	onTriggered: {
		root.triggeredAction();
	}
}
