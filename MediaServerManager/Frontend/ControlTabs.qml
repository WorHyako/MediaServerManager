import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/**
 *  Element struct:
 *  Item root
 *      | Rectangle tabScope
 *          | TabBar tabBar
 *              | Repeater
 *                  | TabButton tabButton
 *          | StackLayout
 *              | Repeater
 *                  | Rectangle
 */
Item {
    id: root
    Rectangle {
        id: tabScope
        anchors.fill: parent
        /**
         *  Color Blue, but alpha - 0 to set Rectangle invisible
         */
        color: "#000000ff"

        TabBar {
            id: tabBar
            height: 50

            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
            }
            Repeater {
                model: ["First", "Second", "Third", "Fourth", "Fifth"]

                TabButton {
                    id: tabButton
                    height: tabBar.height
                    text: modelData
                    width: tabBar.height

                    background: Rectangle {
                        anchors.fill: parent
                        color: "#AAA"
                        radius: 5

                        border {
                            color: "#101010"
                            width: 1
                        }
                    }

                    anchors {
                        bottom: parent.bottom
                    }
                }
                anchors {
                    bottom: parent.bottom
                }
            }
        }
        StackLayout {
            currentIndex: tabBar.currentIndex

            anchors {
                bottom: tabBar.top
                left: tabScope.left
                right: tabScope.right
                top: tabScope.top
            }
            Repeater {
                model: 5

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "#0000ffff"
                    radius: 10

                    border {
                        color: "#AAA"
                        width: 1
                    }
                    ManagementScope {
                        anchors.fill: parent
                    }
                }
            }
        }
    }
}
