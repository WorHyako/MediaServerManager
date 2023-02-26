import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "qrc:/Controls" as CustomControls
import MediaServerManager 1.0 as MSM

/**
 *  Item root
 *      | CustomControls.ButtonSaveConfig
 *      | CustomControls.ButtonAddNewElement
 */
Item {
    id: root
    anchors.fill: parent

    CustomControls.ButtonSaveConfig {
        configFileName: "test.json"
        dynamicScopeType: MSM.DynamicScopeType.ManagementButtons
        elementType: CustomControls.ManagementButton
        scopeObject: root
    }
    CustomControls.ButtonAddNewElement {
        maxElementNum: 30
        newElementArgs: {
            "canBeMoved": true,
            "canBeResized": true,
            "movableScope": root,
            "showCircle": true
        }
        qrcElementPath: "qrc:/Controls/ManagementButton.qml"
        scopeObject: root
    }
}
