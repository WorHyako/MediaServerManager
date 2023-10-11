import QtQuick
import QtQuick.Controls
import Frontend.Controls as WorControls
import MediaServerManager 1.0 as MSM

/**
 *
 */
Item {
    id: root

    anchors.fill: parent

    WorControls.ButtonSaveConfig {
        configFileName: "test.json"
        dynamicScopeType: MSM.DynamicScopeType.QuickButtons
        typeName: "Management button"
        scopeObject: grid
    }

    WorControls.ButtonLoadConfig {
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

    WorControls.ButtonAddNewControl {
        maxElementNum: grid.columns * grid.rows
        scopeObject: grid
    }
}
