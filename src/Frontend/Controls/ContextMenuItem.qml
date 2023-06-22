import QtQuick
import QtQuick.Controls
import "qrc:/Controls" as CustomControls

/**
 * MenuItem
 * string itemText
 */
MenuItem {
	id: menuItem

	required property string itemText

	background: Rectangle {
		anchors.fill: parent
		color: menuItem.highlighted ? "#555" : "transparent"
		radius: 8
	}
	contentItem: CustomControls.TextField
	{
		id: menuItemText
		color: menuItem.highlighted ? "#fff" : "#000"
		horizontalAlignment: Text.AlignLeft
		text: itemText
	}

	onClicked: {
		if (menuItem.text === "Rename") {
			const dialog = ItemCreator.createNewItem("qrc:/Widgets/RenamingDialog.qml", root, {
				"objectToRename": selectedButton,
				"propertyToRename": "text"
			});
			dialog.open();
			return;
		}
		if (menuItem.text === "Change Binding name") {
			return;
		}
		if (menuItem.text === "Delete") {
			selectedButton.destroy();
			return;
		}
	}
}
