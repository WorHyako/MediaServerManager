import QtQuick
import QtQuick.Controls
import TextEditStyle 1.0

/**
 *  Item root
 *      | Rectangle
 */
Item {
    id: root
    width: TextEditStyle.textEditWidth
    height: TextEditStyle.textEditHeight

    Rectangle {
        anchors.fill: root
        border.color: "#939393"
        color: "#C4C4C4"
        border.width: root.activeFocus ? 5 : 1
        radius: 7
    }
}
