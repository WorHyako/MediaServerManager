import QtQuick
import QtQuick.Controls
import Frontend.Styles as WorStyles

/**
 *  Item root
 *      | Rectangle
 */
Item {
	id: root
	height: WorStyles.TextEditStyle.textEditHeight
	width: WorStyles.TextEditStyle.textEditWidth

	Rectangle {
		anchors.fill: root
		color: "#C4C4C4"
		radius: 7

		border {
			color: "#939393"
			width: root.activeFocus ? 3 : 1
		}
	}
}
