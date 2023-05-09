import QtQuick
import QtQuick.Controls
import "qrc:/Styles" as CustomStyles
import "qrc:/Backgrounds" as CustomBackgrounds

/**
 *  Item root
 *  - string text: "Text Edit"
 *      | TextBackgroundRectangle
 *          | TextEdit
 */
Item {
    id: root

    property string text: "Text Edit"

    height: CustomStyles.TextEditStyle.textEditMediumHeight
    width: CustomStyles.TextEditStyle.textEditMediumWidth

    CustomBackgrounds.TextBackgroundRectangle {
        anchors.fill: parent

        TextEdit {
            anchors.fill: parent
            color: CustomStyles.FontStyle.fontColor
            horizontalAlignment: Text.AlignHCenter
            text: root.text
            verticalAlignment: Text.AlignVCenter

            font {
                family: CustomStyles.FontStyle.fontFamily
                pointSize: CustomStyles.FontStyle.fontSize
            }
        }
    }
}
