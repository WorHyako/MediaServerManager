import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "qrc:/Controls" as CustomControls
import "qrc:/Widgets" as CustomWidgets
import "qrc:/JS/itemCreator.js" as ItemCreator

/**
 *  ApplicationWindows root
 *      | Image background
 *      | GridLayout
 *          | QuickButtonsScope
 *          | QuickTitleScope
 *          | Rectangle
 *              | ControlTabs
 *      | ManagementButton buttonSetting
 *          | MouseArea
 *          - createSettingsWindow()
 */
ApplicationWindow {
    id: root
    height: 1000
    title: "Media Server Manager"
    visible: true
    width: 1920

    Rectangle {
        anchors.fill: parent
        color: "#00ff00ff"

        Image {
            id: background
            anchors.fill: parent
            source: "qrc:/Assets/app-background.png"
            z: -1
        }
        GridLayout {
            anchors.fill: parent
            columns: 20
            rows: 3

            CustomWidgets.QuickButtonsScope {
                Layout.column: 1
                Layout.columnSpan: 3
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredHeight: 1
                Layout.preferredWidth: 2
                Layout.row: 2
            }
            CustomWidgets.QuickTitleScope {
                Layout.column: 1
                Layout.columnSpan: 3
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredHeight: 2
                Layout.preferredWidth: 2
                Layout.row: 0
                Layout.rowSpan: 2
            }
            Rectangle {
                Layout.column: 5
                Layout.columnSpan: 6
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredHeight: 3
                Layout.preferredWidth: 4
                Layout.row: 0
                Layout.rowSpan: 3
                /**
                 * Color Green, but alpha - 0 to set Rectangle invisible
                 */
                color: "#0000ff00"

                CustomWidgets.ControlTabs {
                    anchors.fill: parent
                }
            }
        }
        CustomControls.ManagementButton {
            id: buttonSetting
            text: "Settings"

            anchors {
                bottom: parent.bottom
                left: parent.left
            }
            MouseArea {
                anchors.fill: parent

                onClicked: {
                    ItemCreator.createNewItem("qrc:/Settings/SettingsWindow.qml", root);
                }
            }
        }
    }
}
