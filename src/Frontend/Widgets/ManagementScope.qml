import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "qrc:/Controls" as CustomControls
import MediaServerManager 1.0 as MSM

/**
 *  Item root
 *      | Item contentScope
 *      | CustomControls.ButtonSaveConfig
 *      | CustomControls.ButtonAddNewElement
 *      | CustomControls.ButtonLoadConfig
 */
Item {
    id: root
    anchors.fill: parent

    Item {
        id: contentScope
        anchors {
            bottomMargin: 50
            fill: parent
        }
    }
    CustomControls.ButtonSaveConfig {
        configFileName: "test.json"
        dynamicScopeType: MSM.DynamicScopeType.ManagementButtons
        elementType: CustomControls.ManagementButton
        scopeObject: contentScope
    }
    CustomControls.ButtonAddNewElement {
        maxElementNum: 30
        newElementArgs: {
            "canBeMoved": true,
            "canBeResized": true,
            "movableScope": root,
            "showCircle": true,
            "onClicked": () => {
                console.log("clicked");
            }
        }
        qrcElementPath: "qrc:/Controls/ManagementButton.qml"
        scopeObject: contentScope
    }
    CustomControls.ButtonLoadConfig {
        configFileName: "test.json"
        dynamicScopeType: MSM.DynamicScopeType.ManagementButtons
        scopeObject: contentScope
    }
}
