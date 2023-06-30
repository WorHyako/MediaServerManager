import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Frontend.Controls as WorControls
import Frontend.Backgrounds as WorBackgrounds

/**
 *
 *
 * ---
 *
 *  Item (root)
 *  | ColumnLayout
 *  	| RowLayout
 *  		| WorBackgrounds.TextBackgroundRectangle
 *  			| WorControls.Text
 *  		| WorControls.EditTextField (destinationIpTextEdit)
 *  	| RowLayout
 *  		| WorBackgrounds.TextBackgroundRectangle
 *  			| WorControls.Text
 *  		| WorControls.EditTextField (destinationPortTextEdit)
 *	| WorControls.Button
 */
Item {
	id: root

	ColumnLayout {
		anchors {
			horizontalCenter: parent.horizontalCenter
			verticalCenter: parent.verticalCenter
		}
		RowLayout {
			WorBackgrounds.TextBackgroundRectangle {
				height: 30
				width: 100

				WorControls.Text {
					text: "Destination ip"
				}
			}
			WorControls.EditTextField {
				id: destinationIpTextEdit
			}
		}
		RowLayout {
			WorBackgrounds.TextBackgroundRectangle {
				height: 30
				width: 100

				WorControls.Text {
					text: "Destination port"
				}
			}
			WorControls.EditTextField {
				id: destinationPortTextEdit

			}
		}
	}
	WorControls.Button {
		text: "Apply"

		onLeftClicked: () => {
		}

		height: 100
		width: 100
		anchors {
			bottom: parent.bottom
			bottomMargin: 50
			right: parent.right
			rightMargin: 50
		}
	}
}
