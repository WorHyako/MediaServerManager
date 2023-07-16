import QtQuick
import Frontend.Styles as WorStyles

/**
 *
 *
 * ---
 *
 *  Text
 */
Text {
	color: WorStyles.FontStyle.fontColor
	horizontalAlignment: Text.AlignHCenter
	text: "Text"
	verticalAlignment: Text.AlignVCenter

	font {
		family: WorStyles.FontStyle.fontFamily
		pointSize: WorStyles.FontStyle.fontSize
	}
}
