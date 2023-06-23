import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Frontend.Widgets as WorWidgets
import Frontend.Backgrounds as WorBackgrounds

/**
 *  Element struct:
 *  Item root
 *      | Item tabScope
 *          | TabBar tabBar
 *              | Repeater
 *                  | TabButton
 *          | StackLayout
 *              | Repeater
 *                  | Rectangle
 */
Item {
	id: root
	Item {
		id: tabScope
		anchors.fill: parent

		TabBar {
			id: tabBar
			height: 50

			anchors {
				bottom: parent.bottom
				horizontalCenter: parent.horizontalCenter
			}
			Repeater {
				model: ["First", "Second", "Third", "Fourth", "Fifth"]

				TabButton {
					height: tabBar.height
					text: modelData
					width: tabBar.height

					background: WorBackgrounds.TabButtonBackground
					{
					}

					anchors.bottom: parent.bottom
				}
				anchors.bottom: parent.bottom
			}
		}
		StackLayout {
			currentIndex: tabBar.currentIndex

			anchors {
				bottom: tabBar.top
				left: tabScope.left
				right: tabScope.right
				top: tabScope.top
			}
			Repeater {
				model: 5

				Rectangle {
					color: "transparent"
					radius: 10

					border {
						color: "#AAA"
						width: 1
					}
					WorWidgets.ManagementScope {
						anchors.fill: parent
					}
				}
			}
		}
	}
}
