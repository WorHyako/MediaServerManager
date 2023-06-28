import QtQuick
import Frontend.Styles as WorStyles
import Frontend.Backgrounds as WorBackgrounds

/**
 *  Item root
 *  - string text: "Text Edit"
 *      | TextBackgroundRectangle
 *          | TextEdit
 */
WorBackgrounds.TextBackgroundRectangle {
    id: root

    property string text: "Text Edit"

    height: WorStyles.TextEditStyle.textEditMediumHeight
    width: WorStyles.TextEditStyle.textEditMediumWidth

    TextEdit {
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
