import QtQuick
import Frontend.Controls as WorControls
import Frontend.Js as WorJs

/**
 * Object based on WorControls.Button to save config for current scope
 */
WorControls.Button {
    id: root

	/**
	 *  Json config file name
	 */
    required property string configFileName

	/**
	 * Type of dynamic scope
	 * <p> Declared in MSM.DynamicScopeType
	 * <p> - MSM.DynamicScopeType.ManagementButtons
	 * <p> - MSM.DynamicScopeType.QuickButtons
	 * <p> - MSM.DynamicScopeType.QuickTitles
	 */
    required property int dynamicScopeType

	/**
	 * String name of dynamic scope. See MSM.DynamicScopeType enum
	 */
    required property string typeName

	/**
	 * Parent scope for loaded elements
	 */
    required property QtObject scopeObject

    height: 50
    text: `Save`
    width: 50

    onLeftClicked: () => {
        const fileExist = jsonManager.TryToFindFile(root.configFileName);
        if (!fileExist) {
            console.log(`Can't find config file`);
            return;
        }
        const items = WorJs.DynamicItemCollector.collectItems(root.scopeObject, root.typeName);
        const savingResult = jsonManager.SaveConfigs(items, root.dynamicScopeType);
        console.log(`Saving result: ${savingResult}`);
    }
}
