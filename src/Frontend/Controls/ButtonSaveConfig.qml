import QtQuick
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
WorControls.Button {
    id: rootButtonSaveConfig

    required property string configFileName
    required property int dynamicScopeType
    required property var elementType
    required property QtObject scopeObject

    height: 50
    text: "Save"
    width: 50

    onClicked: () => {
        const fileExist = jsonManager.TryToFindFile(rootButtonSaveConfig.configFileName);
        if (!fileExist) {
            console.log("Can't find config file");
            return;
        }
        const items = Js.DynamicItemCollector.collectItems(rootButtonSaveConfig.scopeObject, rootButtonSaveConfig.elementType);
        const savingResult = jsonManager.SaveConfigs(items, rootButtonSaveConfig.dynamicScopeType);
        console.log("Saving result: ", savingResult);
    }
}
