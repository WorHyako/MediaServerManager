import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "qrc:/Controls" as CustomControls
import MediaServerManager 1.0 as MSM

/**
 *  Item root
 *      | Rectangle
 *          | ColumnLayout linesList
 *          | CustomControls.ButtonAddNewElement
 *          | CustomControls.ButtonLoadConfig
 *          | CustomControls.ButtonSaveConfig
 */
Item {
	id: root
	Rectangle {
		anchors.fill: parent
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
		CustomControls.ButtonAddNewElement {
			maxElementNum: 10
			qrcElementPath: "qrc:/Controls/QuickTitleLine.qml"
			scopeObject: linesList
		}
		CustomControls.ButtonSaveConfig {
			configFileName: "test.json"
			dynamicScopeType: MSM.DynamicScopeType.QuickTitles
			elementType: CustomControls.QuickTitleLine
			scopeObject: linesList
		}
		CustomControls.ButtonLoadConfig {
			configFileName: "test.json"
			dynamicScopeType: MSM.DynamicScopeType.QuickTitles
			scopeObject: linesList
		}
	}
}
