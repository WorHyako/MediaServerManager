import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "qrc:/Styles" as Styles
import "qrc:/Controls" as CustomControls

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

    property point managementButtonSize: Qt.point(Styles.ManagementButtonStyle.managementButtonSmallWidth, Styles.ManagementButtonStyle.managementButtonSmallHeight)
    property int spacing: 10
    property point textEditFiledSize: Qt.point(Styles.TextEditStyle.textEditLargeWidth, Styles.TextEditStyle.textEditLargeHeight)

    RowLayout {
        height: 50
        spacing: root.spacing
        width: 100

        CustomControls.EditTextField {
            Layout.alignment: Layout.Center
            height: root.textEditFiledSize.y
            text: "Text example"
            width: root.textEditFiledSize.x
        }
        CustomControls.ManagementButton {
            height: root.managementButtonSize.y
            text: "Send"
            width: root.managementButtonSize.x
        }
    }
}