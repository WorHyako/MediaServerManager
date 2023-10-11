import QtQuick
import QtQuick.Layouts
import Frontend.Backgrounds as WorBackgrounds
import Frontend.Controls as WorControls
import Frontend.Js as WorJs

/**
 *
 */
Window {
	id: root

	modality: Qt.ApplicationModal

	/**
	 * New text value
	 */
	property string newText: "-"

	/**
	 * Object to change displayed text
	 */
	property QtObject objectToRename

	/**
	 * Object's property to rename
	 */
	property string propertyToRename

	height: 250
	width: 350

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

		WorControls.Text {
			font.pointSize: 20
			text: "Renaming window"
		}

		Repeater {
			model: [["Previous", root.objectToRename[root.propertyToRename]], ["New", root.newText]]

			WorBackgrounds.TextBackgroundRectangle {
				Layout.alignment: Qt.AlignCenter
				Layout.preferredHeight: 50
				Layout.preferredWidth: root.width * 0.9

				RowLayout {
					anchors.fill: parent

					WorControls.Text {
						Layout.fillHeight: true
						Layout.fillWidth: true
						font.pointSize: 20
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
						font.pointSize: 20
						horizontalAlignment: Text.AlignHCenter
						readOnly: index === 0
						text: modelData[1]
						verticalAlignment: Text.AlignVCenter

						onTextChanged: {
							if (index !== 0) {
								root.newText = text;
							}
						}
					}
				}
			}
		}

		WorControls.Button {
			Layout.alignment: Qt.AlignCenter
			text: "Apply"
			width: 100
			height: 50
			onLeftClicked: () => {
				WorJs.Renamer.rename(root.objectToRename, root.propertyToRename, root.newText);
				root.close();
				// root.destroy();
			}
		}
	}
}
