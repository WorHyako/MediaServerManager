import QtQuick
import QtQuick.Controls
import Frontend.Controls as WorControls
import MediaServerManager 1.0 as MSM

/**
 *
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
		typeName: "Management button"
		scopeObject: contentScope
	}

	WorControls.ButtonAddNewControl {
		maxElementNum: 30
		scopeObject: contentScope
		newElementArgs: `
			canBeMoved: true
			canBeResized: true`
	}

	WorControls.ButtonLoadConfig {
		configFileName: "test.json"
		dynamicScopeType: MSM.DynamicScopeType.ManagementButtons
		scopeObject: contentScope
	}

	WorControls.ContextMenu {
		id: contextMenu
		selectedButton: contentScope
	}
}
