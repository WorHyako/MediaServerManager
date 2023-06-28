import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Frontend.Controls as WorControls
import MediaServerManager 1.0 as MSM

/**
 *  Item root
 *      | Rectangle
 *          | ColumnLayout linesList
 *          | WorControls.ButtonAddNewElement
 *          | WorControls.ButtonLoadConfig
 *          | WorControls.ButtonSaveConfig
 */
Rectangle {
    id: root

    color: "transparent"
    radius: 10

    border {
        color: "#AAA"
        width: 1
    }
    ColumnLayout {
        id: linesList

        anchors.top: parent.top
        spacing: 50
    }
    WorControls.ButtonAddNewElement {
        maxElementNum: 10
        qrcElementPath: "qrc:/WorHyako/MediaServerManager/Frontend/Controls/QuickTitleLine.qml"
        scopeObject: linesList
    }
    // WorControls.ButtonSaveConfig {
    // 	configFileName: "test.json"
    // 	dynamicScopeType: MSM.DynamicScopeType.QuickTitles
    //	elementType: WorControls.QuickTitleLine
    //	scopeObject: linesList
    // }
    WorControls.ButtonLoadConfig {
        configFileName: "test.json"
        dynamicScopeType: MSM.DynamicScopeType.QuickTitles
        scopeObject: linesList
    }
}
