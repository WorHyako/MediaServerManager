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
	 * Is button can be moved in dynamic scope
	 */
	property bool canBeMoved: false

	/**
	 * Is button can be resized in dynamic scope
	 */
	property bool canBeResized: false

	/**
	 * Editable text for Text Field
	 */
	property string text: `Text Edit`

	height: 30
	width: 200

	Binding {
		root.text: textEdit.text
		restoreMode: Binding.RestoreBindingOrValue
	}

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
