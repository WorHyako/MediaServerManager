import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "qrc:/Controls" as CustomControls
import "qrc:/Settings" as CustomSettings
import "qrc:/Backgrounds" as CustomBackgrounds

/**
 *  ApplicationWindow root
 *      | CustomControls.CloseButton
 *      | TabBar
 *          | Repeater
 *              | TabButton
 */
ApplicationWindow {
    id: root
    height: 600
    width: 1000

    TabBar {
        id: tabBar
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
        Repeater {
            model: ["Network", "Midi"]

            TabButton {
                anchors.bottom: parent.bottom
                height: 50
                text: modelData
                width: 50
                x: 0
                y: 50 * index

                background: CustomBackgrounds.TabButtonBackground {
                }
            }
        }
    }
    StackLayout {
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        CustomSettings.NetworkSettings {
        }
        CustomSettings.MidiSettings {
        }
    }
}
