import QtQuick
import QtQuick.Controls

/**
 *  Item root
 *  - bool showCircle: false
 *      | Rectangle background
 *          | Rectangle circle
 */
Item {
    id: root

    property bool showCircle: false

    Rectangle {
        id: background
        anchors.fill: root
        color: "#C4C4C4"
        radius: 7

        border {
            color: "#939393"
            width: root.activeFocus ? 2 : 1
        }

        Rectangle {
            id: circle
            color: parent.color
            height: background.radius * 2
            radius: background.radius
            visible: showCircle
            width: background.radius * 2

            border {
                color: parent.border.color
                width: 2
            }
            anchors {
                bottom: parent.bottom
                right: parent.right
            }
        }
    }
}
