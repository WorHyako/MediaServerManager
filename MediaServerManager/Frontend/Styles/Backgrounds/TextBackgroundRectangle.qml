import QtQuick
import QtQuick.Controls
import "qrc:/Styles" as Styles

/**
 *  Item root
 *      | Rectangle
 */
Item {
    id: root
    height: Styles.TextEditStyle.textEditHeight
    width: Styles.TextEditStyle.textEditWidth

    Rectangle {
        anchors.fill: root
        color: "#C4C4C4"
        radius: 7

        border {
            color: "#939393"
            width: root.activeFocus ? 5 : 1
        }
    }
}
