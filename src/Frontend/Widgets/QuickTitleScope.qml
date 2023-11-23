import QtQuick
import QtQuick.Layouts
import Frontend.Controls as WorControls
import MediaServerManager 1.0 as MSM

/**
 *
 */
Rectangle {
    id: root

    color: `transparent`
    radius: 10

    border {
        color: `#AAA`
        width: 1
    }

    ColumnLayout {
        id: linesList

        anchors.top: parent.top
        spacing: 50
    }

    WorControls.ButtonAddNewControl {
        maxElementNum: 10
        scopeObject: linesList
    }

    WorControls.ButtonSaveConfig {
        configFileName: `test.json`
        dynamicScopeType: MSM.DynamicScopeType.QuickTitles
        scopeObject: linesList
    }

    WorControls.ButtonLoadConfig {
        configFileName: `test.json`
        dynamicScopeType: MSM.DynamicScopeType.QuickTitles
        scopeObject: linesList
    }
}
