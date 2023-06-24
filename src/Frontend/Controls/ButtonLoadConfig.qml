import QtQuick
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
WorControls.Button {
    id: rootButtonLoadConfig

    required property string configFileName
    required property int dynamicScopeType
    required property QtObject scopeObject

    height: 50
    text: "Load"
    width: 50

    onClicked: () => {
        const fileExist = jsonManager.TryToFindFile(rootButtonLoadConfig.configFileName);
        if (!fileExist) {
            console.log("Can't find config file");
            return;
        }
        const configString = jsonManager.LoadConfigs(rootButtonLoadConfig.dynamicScopeType);
        if (configString === "null") {
            console.log("Can't load json from config file");
            return;
        }
        const loadingUiResult = Js.ConfigLoader.loadUiFromConfig(configString, rootButtonLoadConfig.dynamicScopeType, rootButtonLoadConfig.scopeObject);
        console.log("Loading UI Elements from config:", loadingUiResult);
    }
}
