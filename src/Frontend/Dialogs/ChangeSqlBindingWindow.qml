import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQml.Models
import Frontend.Controls as WorControls

/**
 *
 */
Window {
	id: root

	height: 300
	width: 500

	modality: Qt.ApplicationModal

	/**
	 * Object to change this one binding text
	 */
	property QtObject selectedButton: undefined

}
