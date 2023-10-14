import QtQuick
import Frontend.Styles as WorStyles

/**
 *
 */
Rectangle {
    id: root

    color: `#C4C4C4`
    height: WorStyles.TextEditStyle.textEditHeight
    radius: 7
    width: WorStyles.TextEditStyle.textEditWidth

    border {
        color: `#939393`
        width: root.activeFocus ? 3 : 1
    }
}
