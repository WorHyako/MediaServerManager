import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FontStyle 1.0
import TextEditStyle 1.0

/**
 *  Item root
 *  - string text: "Text Edit"
 *      | TextBackgroundRectangle
 *          | TextEdit
 */
Item {
    id: root

    property string text: "Text Edit"

    height: TextEditStyle.textEditMediumHeight
    width: TextEditStyle.textEditMediumWidth

    TextBackgroundRectangle {
        height: root.height
        width: root.width

        TextEdit {
            anchors.fill: parent
            color: FontStyle.fontColor
            font.family: FontStyle.fontFamily
            font.pointSize: FontStyle.fontSize
            horizontalAlignment: Text.AlignHCenter
            text: root.text
            verticalAlignment: Text.AlignVCenter
        }
    }
}
