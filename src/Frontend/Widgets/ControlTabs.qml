import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Frontend.Widgets as WorWidgets
import Frontend.Backgrounds as WorBackgrounds
import Frontend.Js as WorJs

/**
 *
 */
Item {
	id: root

	/**
	 * Ref to repeater which contain management scopes
	 */
	readonly property var managementScopeRepeaterRed: managementScopeRepeater

	anchors.fill: parent

	/**
	 *
	 */
	function addNewTab(tabName) {
		let temp = [];
		for (let id in tabRepeater.model) {
			temp.push(tabRepeater.model[id]);
		}
		temp.push(tabName);
		tabRepeater.model = temp;
	}

	TabBar {
		id: tabBar

		height: 50

		anchors {
			bottom: parent.bottom
			horizontalCenter: parent.horizontalCenter
		}

		Repeater {
			id: tabRepeater
			anchors.bottom: parent.bottom
			model: [`First`, `Second`, `Third`, `Fourth`, `Fifth`]

			TabButton {
				anchors.bottom: parent.bottom
				height: tabBar.height
				text: modelData
				width: tabBar.height

				background: WorBackgrounds.TabButtonBackground
				{
				}
			}
		}
		TabButton {
			anchors.bottom: parent.bottom
			height: tabBar.height
			text: `+`
			width: tabBar.height

			onClicked: {
				let window = WorJs.ItemCreator.createItem(
					`WorDialogs`,
					`CreateTabDialog`,
					``,
					root,
					`CreateTabDialog`);
				window.show();
				window.onSuccessClosing.connect((tabName) => {
					root.addNewTab(tabName);
				});
			}

			background: WorBackgrounds.TabButtonBackground
			{
			}
		}
	}

	StackLayout {
		currentIndex: tabBar.currentIndex

		anchors {
			bottom: tabBar.top
			left: root.left
			right: root.right
			top: root.top
		}

		Repeater {
			id: managementScopeRepeater
			model: 5

			Rectangle {
				color: `transparent`
				radius: 10

				border {
					color: `#AAA`
					width: 1
				}

				WorWidgets.ManagementScope {
					anchors.fill: parent
				}
			}
		}
	}
}
