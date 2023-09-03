import QtQuick

/**
 *
 *
 * ---
 *
 *  Rectangle (root)
 *  - bool showCircle: false
 *      | Rectangle
 */
Rectangle {
    id: root

    property bool showCircle: false
	property bool hoveredCondition: false

    color: hoveredCondition ? "#F4F4F4" : "#C4C4C4"
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
