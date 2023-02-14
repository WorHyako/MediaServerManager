import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ManagementButtonStyle 1.0
import TextEditStyle 1.0

Item {
    id: root
    ColumnLayout {
        spacing: 50

        Repeater {
            id: stringRepeater
            model: 6

            RowLayout {
                height: 50
                spacing: 10
                width: 100
                EditTextField {
                    height: TextEditStyle.textEditLargeHeight
                    text: "Text example"
                    width: TextEditStyle.textEditLargeWidth
                }
                ManagementButton {
                    height: ManagementButtonStyle.managementButtonSmallHeight
                    text: "Send"
                    width: ManagementButtonStyle.managementButtonSmallWidth
                }
            }
        }
    }
}
