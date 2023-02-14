import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ManagementButtonStyle 1.0
import TextEditStyle 1.0

/**
 *  Item root
 *  - point managementButtonSize:
 *  - int spacing: 10
 *  - point textEditFiledSize:
 *      | RowLayout
 *          | EditTextField
 *          | ManagementButton
 */
Item {
    id: root

    property point managementButtonSize: Qt.point(ManagementButtonStyle.managementButtonSmallWidth, ManagementButtonStyle.managementButtonSmallHeight)
    property int spacing: 10
    property point textEditFiledSize: Qt.point(TextEditStyle.textEditLargeWidth, TextEditStyle.textEditLargeHeight)

    RowLayout {
        height: 50
        spacing: root.spacing
        width: 100

        EditTextField {
            Layout.alignment: Layout.Center
            height: root.textEditFiledSize.y
            text: "Text example"
            width: root.textEditFiledSize.x
        }
        ManagementButton {
            height: root.managementButtonSize.y
            text: "Send"
            width: root.managementButtonSize.x
        }
    }
}