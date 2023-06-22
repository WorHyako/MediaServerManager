import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Frontend.Styles as WorStyles
import Frontend.Controls as WorControls
import Frontend.Backgrounds as WorBackgrounds

/**
 *  Item root
 *  - point managementButtonSize:
 *  - int spacing: 10
 *  - string text: "Text Example"
 *  - point textEditFiledSize:
 *      | RowLayout
 *          | EditTextField
 *          | Button
 *          | worControls.ContextMenu contextMenu
 *          | MouseArea menuMouseArea
 */
Item {
	id: root

	property point managementButtonSize: Qt.point(WorStyles.ManagementButtonStyle.managementButtonSmallWidth, WorStyles.ManagementButtonStyle.managementButtonSmallHeight)
	property int spacing: 10
	property string text: "Text Example"
	property point textEditFiledSize: Qt.point(WorStyles.TextEditStyle.textEditLargeWidth, WorStyles.TextEditStyle.textEditLargeHeight)

	RowLayout {
		height: 50
		spacing: root.spacing
		width: 100

		worControls.EditTextField {
			Layout.alignment: Layout.Center
			height: root.textEditFiledSize.y
			text: root.text
			width: root.textEditFiledSize.x
		}
		Button {
			Layout.preferredHeight: 30
			Layout.preferredWidth: 70

			background: WorBackgrounds.ButtonBackgroundRectangle
			{
			}
			contentItem: worControls.TextField
			{
				opacity: enabled ? 1.0 : 0.3
				text: "Send"

				font {
					family: WorStyles.FontStyle.fontFamily
					pointSize: WorStyles.FontStyle.fontSize
				}
			}

			/// TODO: here and in ManagementButton create context menu dynamically
			worControls.ContextMenu {
				id: contextMenu
				actionTypes: worControls.ContextMenu.ActionType.Delete
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
