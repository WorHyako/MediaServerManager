import QtQuick
import QtQuick.Layouts
import Frontend.Controls as WorControls

/**
 * Window, that allow user to enter name for new tab.
 * <p/>
 * Use <code>onSuccessClosing</code> to get new tab name on success closing window.
 *
 * @author Wor Hyako
 */
Window {
	id: root

	modality: Qt.ApplicationModal

	/**
	 * Signal to track successful window closing.
	 * <p/>
	 * @param string	New tab name
	 */
	signal successClosing(string tabName)

	RowLayout {
		anchors.fill: parent

		WorControls.Text {
			Layout.fillHeight: true
			Layout.fillWidth: true
			font.pointSize: 20
			text: `New tab text`
		}

		WorControls.EditTextField {
			id: textField
			text: `New tab`
		}
	}

	WorControls.Button {
		anchors {
			bottom: parent.bottom
			right: parent.right
		}
		width: 100
		height: 50
		onLeftClicked: () => {
			root.successClosing(textField.text);
			root.close();
			root.destroy();
		}
	}
}
