import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Frontend.Settings as WorSettings
import Frontend.Backgrounds as WorBackgrounds
import Frontend.Js as WorJs
import Frontend.Controls as WorControls

/**
 *
 *
 * ---
 *
 *  ApplicationWindow (root)
 *  | Image
 *  | TabBar (tabBar)
 *      | Repeater
 *          | TabButton
 * 	| StackLayout
 * 		| WorSettings.NetworkSettings
 * 		| WorSettings.MidiSettings
 */
ApplicationWindow {
	id: root
	height: 600
	width: 1000

	Image {
		anchors.fill: parent
		source: WorJs.ObjectsQrcPath.qrcBackgroundImage
		z: -1
	}

	TabBar {
		id: tabBar
		anchors {
			bottom: parent.bottom
			horizontalCenter: parent.horizontalCenter
		}

		Repeater {
			model: ["Network", "Midi"]

			TabButton {
				anchors.bottom: parent.bottom
				height: 50
				text: modelData
				width: 50
				x: 0
				y: 50 * index

				background: WorBackgrounds.TabButtonBackground
				{
				}
			}
		}
	}

	StackLayout {
		anchors.fill: parent
		currentIndex: tabBar.currentIndex

		WorSettings.NetworkSettings {
		}

		WorSettings.MidiSettings {
		}
	}
	WorControls.Button {
		anchors {
			bottom: parent.bottom
			right: parent.right
		}
		text: "New"
		width: 100
		height: 50
		onLeftClicked: () => {
			let window = WorJs.ItemCreator.createNewItem(WorJs.ObjectsQrcPath.qrcCreateElementDialog, root, {});
			window.show();
		}
	}
}
