import QtQuick
import QtQuick.Controls

/**
 *  Item root
 *  - var window
 *      | Button
 */
Item {
    id: root

    required property var window

    height: 20
    width: 20

    anchors {
        right: parent.right
        rightMargin: 5
        top: parent.top
        topMargin: 5
    }
    Button {
        anchors.fill: parent

        background: Rectangle {
            anchors.fill: parent
            color: "#fa3f1d"
            radius: parent.height / 2
        }

        onClicked: {
            window.close();
        }
    }
}
