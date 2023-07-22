import QtQuick
import QtQml
import Frontend.Styles as WorStyles
import Frontend.Backgrounds as WorBackgrounds

/**
 *
 *
 * ---
 *
 *  WorBackgrounds.TextBackground.Rectangle (root)
 *  - string text: "Text Edit"
 *  	| TextEdit
 */
WorBackgrounds.TextBackgroundRectangle {
    id: root

    property string text: "Text Edit"

    height: WorStyles.TextEditStyle.textEditMediumHeight
    width: WorStyles.TextEditStyle.textEditMediumWidth

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
