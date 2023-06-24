import QtQuick
import QtQuick.Controls
import Frontend.Backgrounds as WorBackgrounds
import Frontend.Controls as WorControls
import Frontend.Js as Js
import MediaServerManager 1.0 as MSM

/**
 *  Item root
 *  - text configFileName
 *  - int dynamicScopeType
 *  - QtObject scopeObject
 *      | Button
 */
Item {
	id: root

	required property string configFileName
	required property int dynamicScopeType
	required property QtObject scopeObject

	height: 50
	width: 50

	anchors {
		bottom: parent.bottom
		horizontalCenter: parent.horizontalCenter
	}

	WorControls.Button {
		anchors.fill: parent
		text: "Load"

		onClicked: ()=>{
			const fileExist = jsonManager.TryToFindFile(root.configFileName);
			if (!fileExist) {
				console.log("Can't find config file");
				return;
			}
			const configString = jsonManager.LoadConfigs(root.dynamicScopeType);
			if (configString === "null") {
				console.log("Can't load json from config file");
				return;
			}
			const loadingUiResult = Js.ConfigLoader.loadUiFromConfig(configString, root.dynamicScopeType, root.scopeObject);
			console.log("Loading UI Elements from config:", loadingUiResult);
		}
	}
}
