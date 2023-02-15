import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "qrc:/Controls" as CustomControls
import "qrc:/Widgets" as CustomWidgets

/**
 *  ApplicationWindows root
 *      | Image background
 *      | GridLayout
 *          | ListButtonsTexts
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
            rows: 1

            CustomWidgets.ListButtonsTexts {
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
                /**
                 *  Create settings window. Attach to root.
                 */
                function createSettingsWindow() {
                    var component = Qt.createComponent("qrc:/Settings/SettingsWindow.qml");
                    var window;
                    if (component.status === Component.Ready) {
                        window = component.createObject(root);
                        if (window == null) {
                            console.log("Error on settings window creating");
                            return;
                        }
                        window.show();
                    }
                    console.log("(main)ErrorString: " + component.errorString());
                }

                anchors.fill: parent

                onClicked: {
                    createSettingsWindow();
                }
            }
        }
    }
}
