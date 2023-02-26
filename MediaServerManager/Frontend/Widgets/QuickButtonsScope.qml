import QtQuick
import QtQuick.Controls
import "qrc:/Controls" as CustomControls

/**
 *  Item root
 *  - MSM.JsonQmlWrapper json : jsonManager
 *      | GridView grid
 *      | CustomControls.ButtonSaveConfig
 *      | CustomControls.ButtonLoadConfig
 *      | CustomControls.ButtonAddNewElement
 */
Item {
    id: root
    anchors.fill: parent

    CustomControls.ButtonSaveConfig {
        configFileName: "test.json"
        dynamicScopeType: CustomControls.ButtonSaveConfig.DynamicScopeType.QuickButtons
        elementType: CustomControls.ManagementButton
        scopeObject: grid
    }
    CustomControls.ButtonLoadConfig {
        configFileName: "test.json"
        dynamicScopeType: CustomControls.ButtonSaveConfig.DynamicScopeType.QuickButtons
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
