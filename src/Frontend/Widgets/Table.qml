import QtQuick
import QtQuick.Layouts
import QtQml.Models
import Frontend.Controls as WorControls

/**
 *
 *
 * ---
 *
 * Item (root)
 * - int columnNumber
 * - int rowNumber
 */
Rectangle {
	id: root
	height: 300
	width: 200
	color: "#3f3f3f"
	ListModel {
		id: listModel
	}

	Component {
		id: listViewDelegate
		WorControls.Button {
			height: 50
			width: 50
		}
	}

	ColumnLayout {
		GridView {
			id: listView
			Layout.fillWidth: true
			Layout.preferredHeight: 210
			model: listModel
			delegate: listViewDelegate
		}
	}
}
