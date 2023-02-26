import QtQuick
import QtQuick.Controls
import "qrc:/Backgrounds" as CustomBackgrounds
import "qrc:/JS/DynamicItemCollector.js" as ItemCollector

/**
 *  Item root
 *  - text buttonText : "Save"
 *  - text configFileName
 *  - int dynamicScopeType
 *  - var elementType
 *  - QtObject scopeObject
 *      | Button save button
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
        QuickTitles
    }

    property string buttonText: "Save"
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
            var items = ItemCollector.collectItems(root.scopeObject, root.elementType);
            const savingResult = jsonManager.SaveConfigs(items, dynamicScopeType);
            console.log("Saving result: ", savingResult);
        }
    }
}
