import QtQuick
import QtQuick.Controls
import "qrc:/Styles" as CustomStyles

/**
 *  Text
 */
Text {
    anchors.fill: parent
    color: CustomStyles.FontStyle.fontColor
    horizontalAlignment: Text.AlignHCenter
    text: "Text"
    verticalAlignment: Text.AlignVCenter

    font {
        family: CustomStyles.FontStyle.fontFamily
        pointSize: CustomStyles.FontStyle.fontSize
    }
}
