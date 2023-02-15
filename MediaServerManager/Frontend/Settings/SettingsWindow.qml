import QtQuick
import QtQuick.Controls
import "qrc:/Controls" as CustomControls

/**
 *  ApplicationWindow root
 *      | Rectangle
 *          | TabBar settingsTabBar
 *              | Repeater
 *                  | TabButton
 */
ApplicationWindow {
    id: root
    flags: Qt.FramelessWindowHint | Qt.Window
    height: 600
    width: 1000

    CustomControls.CloseButton{
        window: root
    }

    TabBar {
        id: settingsTabBar
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
        Repeater {
            id: tabButtonRepeater


            model: ["Network", "Midi"]

            TabButton {
                height: 50
                text: modelData
                width: 50
                x: 0
                y: 50 * index

                background: Rectangle {
                    anchors.fill: parent
                    color: "#AAA"
                    radius: 5

                    border {
                        color: "#101010"
                        width: 1
                    }
                }
            }
        }
    }
}
