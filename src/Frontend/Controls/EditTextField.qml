import QtQuick
import QtQml
import Frontend.Styles as WorStyles
import Frontend.Backgrounds as WorBackgrounds

/**
 *
 */
WorBackgrounds.TextBackgroundRectangle {
	id: root

	/**
	 * Editable text for Text Field
	 */
	property string text: `Text Edit`

	function setFocus() {
		textEdit.focus = true;
	}

	height: 30
	width: 200

	TextEdit {
		id: textEdit
		anchors.fill: parent
		color: WorStyles.FontStyle.fontColor
		horizontalAlignment: Text.AlignHCenter
		text: root.text
		verticalAlignment: Text.AlignVCenter

		font {
			family: WorStyles.FontStyle.fontFamily
			pointSize: WorStyles.FontStyle.fontSize
		}
	}
}
