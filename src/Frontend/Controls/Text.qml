import QtQuick
import Frontend.Styles as WorStyles

/**
 *  Text
 */
Text {
	anchors.fill: parent
	color: WorStyles.FontStyle.fontColor
	horizontalAlignment: Text.AlignHCenter
	text: "Text"
	verticalAlignment: Text.AlignVCenter

	font {
		family: WorStyles.FontStyle.fontFamily
		pointSize: WorStyles.FontStyle.fontSize
	}
}
