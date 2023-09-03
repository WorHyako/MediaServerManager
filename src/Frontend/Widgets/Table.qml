import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQml.Models
import Frontend.Controls as WorControls
import Frontend.Backgrounds as WorBackgrounds
import Frontend.QmlObjects.Command as WorCommands

/**
 *
 *
 * ---
 *
 * Item (root)
 * - int columnNumber
 * - int rowNumber
 */
WorBackgrounds.ButtonBackgroundRectangle {
	id: root
	height: 300
	width: 200

	property bool canBeMoved: true
	property bool canBeResized: true

	WorControls.TransformMouseArea {
		canBeMoved: root.canBeMoved
		target: root
		canBeResized: root.canBeResized
		movableScope: root.parent
	}

	WorControls.ContextMenuMouseArea {
		selectedButton: root
	}

	ListModel {
		id: listModel
	}

	Component {
		id: listViewDelegate
    
		WorControls.EditTextField {
			height: 20
			width: 80
		}
	}

	Rectangle {
		color: "transparent"
		radius: 7
		border {
			color: "#939393"
			width: 1
		}
		anchors {
			fill: parent
			margins: 10
			bottomMargin: 40
		}

		ColumnLayout {
			anchors {
				fill: parent
				margins: 5
			}
			ScrollView {
				Layout.fillWidth: true
				Layout.fillHeight: true
				Layout.topMargin: 30
				Layout.bottomMargin: 40

				GridView {
					id: listView
					cellHeight: 25
					cellWidth: 85
					anchors.fill: parent
					model: listModel
					delegate: listViewDelegate
				}
			}
		}
	}

	RowLayout {
		anchors {
			bottom: parent.bottom
			bottomMargin: 5
		}
		width: parent.width

		WorControls.Button {
			width: 70
			height: 30
			text: "Add"
			Layout.alignment: Qt.AlignRight
			contextMenuEnable: false
			onLeftClicked: () => {
				listModel.append({});
			}
		}

		WorControls.Button {
			width: 70
			height: 30
			text: "Send"
			Layout.alignment: Qt.AlignLeft
			contextMenuEnable: false
			onLeftClicked: () => {
			}
		}
	}

	WorCommands.QmlCommandSender {
		id: qmlCommandSender
	}
}
