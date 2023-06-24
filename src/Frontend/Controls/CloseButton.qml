import QtQuick
import Frontend.Controls as WorControls

/**
 *  Item root
 *  - var window
 *      | Button
 */
WorControls.Button {
    id: rootCloseButton

    required property var window

    height: 20
    width: 20

    onClicked: () => {
        window.close();
    }

    anchors {
        right: parent.right
        rightMargin: 5
        top: parent.top
        topMargin: 5
    }
}
