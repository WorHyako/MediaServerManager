import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Frontend.Settings as WorSettings
import Frontend.Backgrounds as WorBackgrounds
import Frontend.Js as WorJs
import Frontend.Controls as WorControls

/**
 *
 */
ApplicationWindow {
	id: root

	modality: Qt.ApplicationModal

	height: 600
	width: 1000

	Image {
		anchors.fill: parent
		source: `qrc:/Frontend/Assets/app-background.png`
		z: -1
	}

	TabBar {
		id: tabBar
		anchors {
			bottom: parent.bottom
			horizontalCenter: parent.horizontalCenter
		}

		Repeater {
			model: [`Network`, `Midi`]

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
		text: `New`
		width: 100
		height: 50
		onLeftClicked: () => {
			let window = WorJs.QrcItemCreator.createNewItem(WorJs.ObjectsQrcPath.qrcCreateElementDialog, root, {});
			window.show();
		}
	}
}
