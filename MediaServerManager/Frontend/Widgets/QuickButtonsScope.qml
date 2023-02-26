import QtQuick
import QtQuick.Controls
import "qrc:/Controls" as CustomControls
import MediaServerManager 1.0 as MSM

/**
 *  Item root
 *  - MSM.JsonQmlWrapper json : jsonManager
 *      | GridView grid
 *      | CustomControls.ButtonSaveConfig
 *      | CustomControls.ButtonAddNewElement
 */
Item {
    id: root

    readonly property MSM.JsonQmlWrapper json: jsonManager

    anchors.fill: parent

    CustomControls.ButtonSaveConfig {
        configFileName: "test.json"
        dynamicScopeType: CustomControls.ButtonSaveConfig.DynamicScopeType.QuickButtons
        elementType: CustomControls.ManagementButton
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
