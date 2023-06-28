import QtQuick
import Frontend.Backgrounds as WorBackgrounds
import Frontend.Controls as WorControls

WorBackgrounds.ButtonBackgroundRectangle {
    id: root

    property var contentIten: undefined
    property bool contextMenuEnable: true
    property var onLeftClicked: undefined
    property var onRightClicked: undefined
    property string text: ""

    function leftClick() {
        leftClickArea.clicked(Qt.MouseEvent);
    }

    function rightClick() {
        rightClickArea.clicked(Qt.MouseEvent);
    }

    showCircle: false

    Component.onCompleted: {
        if (contentItem !== undefined) {
        }
    }

    WorControls.Text {
        anchors.centerIn: parent
        opacity: enabled ? 1.0 : 0.3
        text: root.text
    }
    MouseArea {
        id: rightClickArea

        acceptedButtons: Qt.RightButton
        anchors.fill: parent

        onClicked: mouse => {
            if (root.onRightClicked !== undefined) {
                root.onRightClicked();
            }
            if (root.contextMenuEnable) {
                contextMenu.open(Qt.point(mouse.x, mouse.y));
            }
        }
    }
    MouseArea {
        id: leftClickArea

        acceptedButtons: Qt.LeftButton
        anchors.fill: parent

        onClicked: {
            if (root.onLeftClicked !== undefined) {
                root.onLeftClicked();
            }
        }
    }
    WorControls.ContextMenu {
        id: contextMenu

        selectedButton: root
    }
}