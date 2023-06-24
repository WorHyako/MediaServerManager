import QtQuick
import QtQuick.Controls
import Frontend.Backgrounds as WorBackgrounds
import Frontend.Controls as WorControls

WorBackgrounds.ButtonBackgroundRectangle {
	id: root

	property string text: ""
	required property var onClicked
	showCircle: false

	WorControls.TextField {
		anchors.centerIn: parent
		text: root.text
	}

	MouseArea {
		anchors.fill: parent
		onClicked: {
			root.onClicked();
		}
	}
}
