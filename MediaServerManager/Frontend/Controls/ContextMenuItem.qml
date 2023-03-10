import QtQuick
import QtQuick.Controls

/**
 *
 */
MenuItem {
    id: menuItem

    property string text: "None"

    background: Rectangle {
        anchors.fill: parent
        color: menuItem.highlighted ? "#555" : "transparent"
        radius: 8
    }
    contentItem: Text {
        id: menuItemText
        color: menuItem.highlighted ? "#fff" : "#000"
        horizontalAlignment: Text.AlignLeft
        text: menuItem.text
        verticalAlignment: Text.AlignVCenter
    }
}
