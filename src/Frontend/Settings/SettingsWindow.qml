import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Frontend.Settings as WorSettings
import Frontend.Backgrounds as WorBackgrounds

/**
 *  ApplicationWindow root
 *      | TabBar
 *          | Repeater
 *              | TabButton
 */
ApplicationWindow {
	id: rootSettingsWindow
	height: 600
	width: 1000

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
}
