import QtQuick
import QtQuick.Controls
import Frontend.Backgrounds as WorBackgrounds
import Frontend.Controls as WorControls
import Frontend.Js as Js

/**
 *  Item root
 *  - text configFileName
 *  - int dynamicScopeType
 *  - var elementType
 *  - QtObject scopeObject
 *      | Button save button
 */
Item {
	id: root

	required property string configFileName
	required property int dynamicScopeType
	required property var elementType
	required property QtObject scopeObject

	height: 50
	width: 50

	anchors {
		bottom: parent.bottom
		left: parent.left
	}
	WorControls.Button {
		anchors.fill: parent
		text: "Save"

		onClicked: ()=>{
			const fileExist = jsonManager.TryToFindFile(root.configFileName);
			if (!fileExist) {
				console.log("Can't find config file");
				return;
			}
			const items = Js.DynamicItemCollector.collectItems(root.scopeObject, root.elementType);
			const savingResult = jsonManager.SaveConfigs(items, root.dynamicScopeType);
			console.log("Saving result: ", savingResult);
		}
	}
}
