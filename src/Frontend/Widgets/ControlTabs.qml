import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Frontend.Widgets as WorWidgets
import Frontend.Backgrounds as WorBackgrounds

/**
 *  Element struct:
 *  Item root
 *      | Item rootControlTabs
 *          | TabBar tabBar
 *              | Repeater
 *                  | TabButton
 *          | StackLayout
 *              | Repeater
 *                  | Rectangle
 */
Item {
    id: rootControlTabs

    anchors.fill: parent

    TabBar {
        id: tabBar

        height: 50

        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
        Repeater {
            anchors.bottom: parent.bottom
            model: ["First", "Second", "Third", "Fourth", "Fifth"]

            TabButton {
                anchors.bottom: parent.bottom
                height: tabBar.height
                text: modelData
                width: tabBar.height

                background: WorBackgrounds.TabButtonBackground {
                }
            }
        }
    }
    StackLayout {
        currentIndex: tabBar.currentIndex

        anchors {
            bottom: tabBar.top
            left: rootControlTabs.left
            right: rootControlTabs.right
            top: rootControlTabs.top
        }
        Repeater {
            model: 5

            Rectangle {
                color: "transparent"
                radius: 10

                border {
                    color: "#AAA"
                    width: 1
                }
                WorWidgets.ManagementScope {
                    anchors.fill: parent
                }
            }
        }
    }
}
