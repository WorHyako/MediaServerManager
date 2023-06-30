import QtQuick
import Frontend.Controls as WorControls

/**
 *
 *
 * ---
 *
 *  WorControls.Button root
 *  - var window
 */
WorControls.Button {
    id: root

    required property var window

    height: 20
    width: 20

    onLeftClicked: () => {
        window.close();
    }

    anchors {
        right: parent.right
        rightMargin: 5
        top: parent.top
        topMargin: 5
    }
}
