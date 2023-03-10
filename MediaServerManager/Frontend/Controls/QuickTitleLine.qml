import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "qrc:/Styles" as CustomStyles
import "qrc:/Controls" as CustomControls
import "qrc:/Backgrounds" as CustomBackgrounds

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

    property point managementButtonSize: Qt.point(CustomStyles.ManagementButtonStyle.managementButtonSmallWidth, CustomStyles.ManagementButtonStyle.managementButtonSmallHeight)
    property int spacing: 10
    property string text: "Text Example"
    property point textEditFiledSize: Qt.point(CustomStyles.TextEditStyle.textEditLargeWidth, CustomStyles.TextEditStyle.textEditLargeHeight)

    RowLayout {
        height: 50
        spacing: root.spacing
        width: 100

        CustomControls.EditTextField {
            Layout.alignment: Layout.Center
            height: root.textEditFiledSize.y
            text: root.text
            width: root.textEditFiledSize.x
        }
        Button {
            Layout.preferredHeight: 30
            Layout.preferredWidth: 70

            background: CustomBackgrounds.ButtonBackgroundRectangle {
            }
            contentItem: Text {
                color: CustomStyles.FontStyle.fontColor
                horizontalAlignment: Text.AlignHCenter
                opacity: enabled ? 1.0 : 0.3
                text: "Send"
                verticalAlignment: Text.AlignVCenter

                font {
                    family: CustomStyles.FontStyle.fontFamily
                    pointSize: CustomStyles.FontStyle.fontSize
                }
            }

            /// TODO: here and in ManagementButton create context menu dynamically
            CustomControls.ContextMenu {
                id: contextMenu
                selectedButton: root
            }

            MouseArea {
                id: menuMouseArea
                acceptedButtons: Qt.RightButton
                anchors.fill: parent

                onClicked: {
                    contextMenu.open(Qt.point(mouse.x, mouse.y));
                }
            }
        }
    }
}
