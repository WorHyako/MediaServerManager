import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Frontend.Controls as WorControls
import MediaServerManager 1.0 as MSM

/**
 *  Item root
 *      | Item contentScope
 *      | WorControls.ButtonSaveConfig
 *      | WorControls.ButtonAddNewElement
 *      | WorControls.ButtonLoadConfig
 */
Item {
	id: root
	anchors.fill: parent

	Item {
		id: contentScope
		anchors {
			bottomMargin: 50
			fill: parent
		}
	}
	WorControls.ButtonSaveConfig {
		configFileName: "test.json"
		dynamicScopeType: MSM.DynamicScopeType.ManagementButtons
		elementType: WorControls.ManagementButton
		scopeObject: contentScope
	}
	WorControls.ButtonAddNewElement {
		maxElementNum: 30
		newElementArgs: {
			"canBeMoved": true,
			"canBeResized": true,
			"movableScope": root,
			"showCircle": true,
			"onClicked": () => {
			console.log("clicked");
		}
		}
		qrcElementPath: "qrc:/Controls/ManagementButton.qml"
		scopeObject: contentScope
	}
	WorControls.ButtonLoadConfig {
		configFileName: "test.json"
		dynamicScopeType: MSM.DynamicScopeType.ManagementButtons
		scopeObject: contentScope
	}
}
