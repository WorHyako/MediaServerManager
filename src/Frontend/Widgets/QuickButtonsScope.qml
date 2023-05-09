import QtQuick
import QtQuick.Controls
import "qrc:/Controls" as CustomControls
import MediaServerManager 1.0 as MSM

/**
 *  Item root
 *      | CustomControls.ButtonSaveConfig
 *      | CustomControls.ButtonLoadConfig
 *      | GridView grid
 *      | CustomControls.ButtonAddNewElement
 */
Item {
    id: root
    anchors.fill: parent

    CustomControls.ButtonSaveConfig {
        configFileName: "test.json"
        dynamicScopeType: MSM.DynamicScopeType.QuickButtons
        elementType: CustomControls.ManagementButton
        scopeObject: grid
    }
    CustomControls.ButtonLoadConfig {
        configFileName: "test.json"
        dynamicScopeType: MSM.DynamicScopeType.QuickButtons
        scopeObject: grid
    }
    Grid {
        id: grid
        anchors.fill: parent
        columns: 6
        rows: 5
        spacing: 5
    }
    CustomControls.ButtonAddNewElement {
        maxElementNum: grid.columns * grid.rows
        qrcElementPath: "qrc:/Controls/ManagementButton.qml"
        scopeObject: grid
    }
}
