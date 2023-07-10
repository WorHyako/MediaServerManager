import QtQuick
import QtQuick.Layouts
import QtQml.Models
import Frontend.Controls as WorControls

/**
 *
 *
 * ---
 *
 * Window (root)
 * 	- QtObject selectedButton: undefined
 * 	| ListModel (repeaterModel)
 * 	| ColumnLayout
 * 		| Repeater
 * 			| RowLayout
 * 				| WorControls.EditTextField
 * 				| WorControls.EditTextField
 * 				| WorControls.Button
 * 		| WorControls.Button
 * 		| WorControls.Button
 */
Window {
	id: root
	flags: Qt.Dialog
	height: 300
	width: 500

	property QtObject selectedButton: undefined

	QtObject {
		id: internal
		property int number: 0
	}

	ColumnLayout {
		anchors.fill: parent
		ListView {
			id: listView
			flickableDirection: Flickable.Vertical
			Layout.fillWidth: true
			Layout.fillHeight: true
			model: ListModel {
				id: listModel
			}
			delegate: RowLayout {
				height: 30
				spacing: 4

				WorControls.EditTextField {
					text: "key"
				}
				WorControls.EditTextField {
					text: "value"
				}
				WorControls.Button {
					width: 30
					height: 30
					contextMenuEnable: false
					text: customText
					onLeftClicked: () => {
						console.log("removed index:", index);
						listModel.remove(index, 1);
					}
				}
			}
		}

		WorControls.Button {
			width: 70
			height: 20
			text: "Add"
			contextMenuEnable: false
			onLeftClicked: () => {
				console.log("current model count", listModel.count);
				listModel.append({customText: "Button" + (++internal.number)})
			}
		}

		WorControls.Button {
			contextMenuEnable: false
			width: 100
			height: 20
			text: "Apply"
		}
	}
}
