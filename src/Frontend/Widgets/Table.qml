import QtQuick
import QtQuick.Layouts

/**
 *
 *
 * ---
 *
 * Item (root)
 * - int columnNumber
 * - int rowNumber
 */
Item {
	id: root

	ColumnLayout {
		anchors.fill: parent
	}

	required property int columnNumber
	required property int rowNumber
}
