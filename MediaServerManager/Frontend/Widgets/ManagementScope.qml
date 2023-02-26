import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "qrc:/Controls" as CustomControls

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
        dynamicScopeType: CustomControls.ButtonSaveConfig.DynamicScopeType.ManagementButtons
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
