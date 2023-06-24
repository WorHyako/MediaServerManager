import QtQuick
import Frontend.Backgrounds as WorBackgrounds
import Frontend.Controls as WorControls

WorBackgrounds.ButtonBackgroundRectangle {
    id: rootButton

	property var onClicked
    property string text: ""
	property var contentIten: undefined

    showCircle: false

    Component.onCompleted: {
        if (contentItem !== undefined) {

		}
    }

    WorControls.Text {
        anchors.centerIn: parent
        text: rootButton.text
    }
    MouseArea {
        anchors.fill: parent

        onClicked: {
            rootButton.onClicked();
        }
    }
}
