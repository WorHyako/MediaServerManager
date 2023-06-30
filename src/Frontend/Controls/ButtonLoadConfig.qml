import QtQuick
import Frontend.Controls as WorControls
import Frontend.Js as WorJs
import MediaServerManager 1.0 as MSM

/**
 * Object based on WorControls.Button to load config for current scope and generate all loaded elements
 *
 * ---
 *
 *  WorControls.Button (root)
 *  - string configFileName
 *  - int dynamicScopeType
 *  - QtObject scopeObject
 */
WorControls.Button {
    id: root

    required property string configFileName
    required property int dynamicScopeType
    required property QtObject scopeObject

    height: 50
    text: "Load"
    width: 50

    onLeftClicked: () => {
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
        const loadingUiResult = WorJs.ConfigLoader.loadUiFromConfig(configString, root.dynamicScopeType, root.scopeObject);
        console.log("Loading UI Elements from config:", loadingUiResult);
    }

    anchors {
        bottom: parent.bottom
        left: parent.left
    }
}
