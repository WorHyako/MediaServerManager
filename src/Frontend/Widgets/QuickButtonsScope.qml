import QtQuick
import QtQuick.Controls
import Frontend.Controls as WorControls
import MediaServerManager 1.0 as MSM

/**
 *  Item root
 *      | WorControls.ButtonSaveConfig
 *      | WorControls.ButtonLoadConfig
 *      | GridView grid
 *      | WorControls.ButtonAddNewElement
 */
Item {
	id: root
	anchors.fill: parent

	WorControls.ButtonSaveConfig {
		configFileName: "test.json"
		dynamicScopeType: MSM.DynamicScopeType.QuickButtons
		elementType: WorControls.ManagementButton
		scopeObject: grid
	}
	WorControls.ButtonLoadConfig {
		configFileName: "test.json"
		dynamicScopeType: MSM.DynamicScopeType.QuickButtons
		scopeObject: grid
	}
	Grid {
		id: grid
		anchors.fill: parent
		columns: 6
		rows: 5
		spacing: 5
	}
	WorControls.ButtonAddNewElement {
		maxElementNum: grid.columns * grid.rows
		qrcElementPath: "qrc:/Controls/ManagementButton.qml"
		scopeObject: grid
	}
}
