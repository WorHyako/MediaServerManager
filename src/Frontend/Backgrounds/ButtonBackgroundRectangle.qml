import QtQuick

/**
 *  Item root
 *  - bool showCircle: false
 *      | Rectangle background
 *          | Rectangle
 */
Rectangle {
    id: root

    property bool showCircle: false

    color: "#C4C4C4"
    radius: 7

    border {
        color: "#939393"
        width: root.activeFocus ? 2 : 1
    }
    Rectangle {
        color: parent.color
        height: root.radius * 2
        radius: root.radius
        visible: root.showCircle
        width: root.radius * 2

        border {
            color: root.border.color
            width: 2
        }
        anchors {
            bottom: parent.bottom
            right: parent.right
        }
    }
}
