import QtQuick
import QtQuick.Layouts
import Frontend.Styles as WorStyles
import Frontend.Controls as WorControls

/**
 *
 */
Item {
	id: root

	/**
	 * Object name
	 */
	property string objectName: "Quick title line"

	/**
	 * Management button size
	 */
	property point managementButtonSize: Qt.point(WorStyles.ManagementButtonStyle.managementButtonSmallWidth, WorStyles.ManagementButtonStyle.managementButtonSmallHeight)

	/**
	 * Space between button and Editable text field
	 */
	property int spacing: 10

	/**
	 * Editable text field text
	 */
	property string text: "Text Example"

	/**
	 * Editable text field size
	 */
	property point textEditFiledSize: Qt.point(WorStyles.TextEditStyle.textEditLargeWidth, WorStyles.TextEditStyle.textEditLargeHeight)

	RowLayout {
		height: 50
		spacing: root.spacing
		width: 100

		WorControls.EditTextField {
			Layout.alignment: Layout.Center
			height: root.textEditFiledSize.y
			text: root.text
			width: root.textEditFiledSize.x
		}

		WorControls.Button {
			Layout.preferredHeight: 30
			Layout.preferredWidth: 70
			onLeftClicked: () => {
			}
			onRightClicked: () => {

			}
			text: "Send"

			WorControls.ContextMenu {
				id: contextMenu
				actionTypes: WorControls.ContextMenu.ActionType.Delete
				selectedButton: root
			}

			MouseArea {
				id: menuMouseArea
				acceptedButtons: Qt.RightButton
				anchors.fill: parent

				onClicked: {
					contextMenu.popup();
				}
			}
		}
	}
}
