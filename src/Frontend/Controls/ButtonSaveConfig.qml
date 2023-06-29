import QtQuick
import Frontend.Controls as WorControls
import Frontend.Js as WorJs

/**
 *  Item root
 *  - text configFileName
 *  - int dynamicScopeType
 *  - string typeName
 *  - QtObject scopeObject
 *      | Button save button
 */
WorControls.Button {
    id: root

    required property string configFileName
    required property int dynamicScopeType
    required property string typeName
    required property QtObject scopeObject

    height: 50
    text: "Save"
    width: 50

    onLeftClicked: () => {
        const fileExist = jsonManager.TryToFindFile(root.configFileName);
        if (!fileExist) {
            console.log("Can't find config file");
            return;
        }
        const items = WorJs.DynamicItemCollector.collectItems(root.scopeObject, root.typeName);
        const savingResult = jsonManager.SaveConfigs(items, root.dynamicScopeType);
        console.log("Saving result: ", savingResult);
    }
}
