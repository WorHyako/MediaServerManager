import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Frontend.Backgrounds as WorBackgrounds
import Frontend.Controls as WorControls
import Frontend.Js as WorWorJs

/**
 * Dialog root
 * - string newText: "-"
 * - string propertyToRename
 * - QtObject objectToRename
 * - onTextEditFinished(text)
 *      | ColumnLayout
 *          | WorControls.TextField
 *          | Repeater
 *          - model: [["Previous", root.previousText], ["New", root.newText]]
 *              | WorControls.TextField
 *              | Rectangle
 *              | TextEdit
 *          | Button
 */
Dialog {
	id: root

	property string newText: "-"
	required property QtObject objectToRename
	required property string propertyToRename

	/// TODO: Make binding between TextEdit and property newText
	/**
	 * Function exist just by one reason. Damned TextEdit in Repeater can't find "root" id
	 * @param text  New text
	 */
	function onTextEditFinished(text) {
		root.newText = text;
	}

	height: 250
	width: 350

	background: Rectangle {
		anchors.fill: parent
		border.color: "#444"
		border.width: 4
		color: "#a4a4a4"
		radius: 10
	}

	ColumnLayout {
		height: root.height * 0.8
		spacing: 5
		width: root.width * 0.8

		anchors {
			bottomMargin: 10
			fill: parent
			leftMargin: 10
			rightMargin: 10
			topMargin: 10
		}
		WorControls.TextField {
			font.pixelSize: 20
			text: "Renaming window"
		}
		Repeater {
			id: repeater
			model: [["Previous", root.objectToRename[propertyToRename]], ["New", root.newText]]

			WorBackgrounds.TextBackgroundRectangle {
				Layout.alignment: Qt.AlignCenter
				Layout.preferredHeight: 50
				Layout.preferredWidth: root.width * 0.9

				RowLayout {
					anchors.fill: parent

					WorControls.TextField {
						Layout.fillHeight: true
						Layout.fillWidth: true
						font.pixelSize: 20
						text: modelData[0]
					}
					Rectangle {
						Layout.fillHeight: true
						color: "#222"
						width: 1
					}
					TextEdit {
						Layout.fillHeight: true
						Layout.fillWidth: true
						Layout.maximumWidth: 220
						Layout.minimumWidth: 20
						font.pixelSize: 20
						horizontalAlignment: Text.AlignHCenter
						readOnly: index === 0
						text: modelData[1]
						verticalAlignment: Text.AlignVCenter

						onEditingFinished: {
							onTextEditFinished(text);
						}
					}
				}
			}
		}
		WorControls.ManagementButton {
			Layout.alignment: Qt.AlignCenter
			text: "Apply"

			onClicked: () => {
				focus = true;
				WorJs.Renamer.rename(root.objectToRename, root.propertyToRename, root.newText);
				root.accept();
			}
		}
	}
}
