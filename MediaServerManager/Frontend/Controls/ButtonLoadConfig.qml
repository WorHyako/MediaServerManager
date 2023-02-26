import QtQuick
import QtQuick.Controls
import "qrc:/Backgrounds" as CustomBackgrounds
import "qrc:/JS/itemCreator.js" as ItemCreator
import "qrc:/JS/ConfigParser.js" as ConfigParser

/**
 *  Item root
 *  - text configFileName
 *  - int dynamicScopeType
 *  - QtObject scopeObject
 *      | Button
 *
 *  enum DynamicScopeType : {
 *         QuickButtons,
 *         ManagementButtons,
 *         QuickTitles
 *         }
 */
Item {
    id: root
    enum DynamicScopeType {
        QuickButtons,
        ManagementButtons,
        QuickTitles,
        All
    }

    required property string configFileName
    required property int dynamicScopeType
    required property QtObject scopeObject

    height: 50
    width: 50

    anchors {
        left: parent.left
        top: parent.toop
    }
    Button {
        anchors.fill: parent
        text: root.buttonText

        background: CustomBackgrounds.ButtonBackgroundRectangle {
            showCircle: false
        }

        onClicked: {
            const fileExist = jsonManager.TryToFindFile(root.configFileName);
            if (!fileExist) {
                console.log("Can't find config file");
                return;
            }
            var configString = jsonManager.LoadConfigs(root.dynamicScopeType);
            const loadingResult = configString !== "null";
            if (!loadingResult) {
                console.log("Can't load json from config file");
                return;
            }
            console.log("configString", configString);
            var configArray = ConfigParser.parseConfig(configString);
            console.log("configArray", configArray)
            var loadingUiResult = ConfigParser.loadUiFromConfig(configArray);
            console.log("Loading UI Elements from config:", loadingUiResult);
        }
    }
}
