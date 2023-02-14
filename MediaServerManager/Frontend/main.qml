import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/**
 *  ApplicationWindows root
 *      | Image background
 *      | GridLayout
 *          | ListButtonsTexts
 *          | Rectangle
 *              | ControlTabs
 *      | ManagementButton buttonSetting
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
            source: "qrc:/Frontend/Assets/app_background.png"
            z: -1
        }
        GridLayout {
            anchors.fill: parent
            columns: 20
            rows: 1

            ListButtonsTexts {
                Layout.column: 1
                Layout.columnSpan: 3
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredHeight: 1
                Layout.preferredWidth: 2
                Layout.row: 1
                Layout.rowSpan: 1
            }
            Rectangle {
                Layout.column: 5
                Layout.columnSpan: 6
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredHeight: 1
                Layout.preferredWidth: 4
                Layout.row: 1
                Layout.rowSpan: 1
                /**
                 * Color Green, but alpha - 0 to set Rectangle invisible
                 */
                color: "#0000ff00"

                ControlTabs {
                    anchors.fill: parent
                }
            }
        }
        ManagementButton {
            id: buttonSetting
            text: "Settings"
            anchors.bottom: parent.bottom
            anchors.left: parent.left
        }
    }
}
