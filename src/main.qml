import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Frontend.Controls as WorControls
import Frontend.Widgets as WorWidgets
import Frontend.Js as WorJs
import Backend.BackFol as Back

/**
 *  ApplicationWindows root
 *      | Image background
 *      | GridLayout
 *          | QuickButtonsScope
 *          | QuickTitleScope
 *          | Rectangle
 *              | ControlTabs
 *      | ManagementButton
 */
ApplicationWindow {
    id: root

    height: 1000
    title: "Media Server Manager"
    visible: true
    width: 1920

    Item {
        anchors.fill: parent

        Image {
            id: background

            anchors.fill: parent
            source: WorJs.ObjectsQrcPath.qrcBackgroundImage
            z: -1
        }
        GridLayout {
            anchors.fill: parent
            columns: 20
            rows: 3

            Rectangle {
                Layout.column: 1
                Layout.columnSpan: 3
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredHeight: 1
                Layout.preferredWidth: 2
                Layout.row: 2
                color: "transparent"
                radius: 10

                border {
                    color: "#AAA"
                    width: 1
                }
                WorWidgets.QuickButtonsScope {
                }
            }
            WorWidgets.QuickTitleScope {
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
                color: "transparent"

                WorWidgets.ControlTabs {
                    anchors.fill: parent
                }
            }
        }
		Back.Back{
			id: back
		}
        WorControls.ManagementButton {
            buttonText: back.userName

            onLeftClicked: () => {
                WorJs.ItemCreator.createNewItem(WorJs.ObjectsQrcPath.qrcSettingsWindow, root);
            }

            anchors {
                bottom: parent.bottom
                right: parent.right
            }
        }
    }
}
