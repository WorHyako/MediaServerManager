import QtQuick
import QtQuick.Controls
import "qrc:/Backgrounds" as CustomBackgrounds
import "qrc:/JS/DynamicItemCollector.js" as ItemCollector

/**
 *  Item root
 *  - text configFileName
 *  - QtObject scopeObject
 *  - text buttonText : "Save"
 *  - var elementType
 *      | Button save button
 */
Item {
    id: root

    property string buttonText: "Save"
    required property string configFileName
    required property var elementType
    required property QtObject scopeObject

    height: 50
    width: 50

    anchors {
        bottom: parent.bottom
        left: parent.left
    }
    Button {
        id: saveCurrentState
        anchors.fill: parent
        text: root.buttonText

        background: CustomBackgrounds.ButtonBackgroundRectangle {
            showCircle: false
        }

        onClicked: {
            const QuickButtonsScopeId = 0;
            const fileExist = jsonManager.TryToFindFile(root.configFileName);
            if (!fileExist) {
                console.log("Can't find config file");
                return;
            }
            var items = ItemCollector.collectItems(root.scopeObject, root.elementType);
            /// TODO: Need to separate ScopeId as Qt debug
            const savingResult = jsonManager.SaveConfigs(items, QuickButtonsScopeId);
            console.log("Saving result: ", savingResult);
        }
    }
}
