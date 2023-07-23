import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQml.Models
import Frontend.Controls as WorControls
import Frontend.Backgrounds as WorBackgrounds

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
		WorControls.Button {
			height: 20
			width: 80
		}
	}

	ColumnLayout {
		anchors.fill: parent
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

		WorControls.Button {
			width: 70
			height: 20
			text: "Add"
			contextMenuEnable: false
			onLeftClicked: () => {
				listModel.append({});
			}
		}
	}
}
