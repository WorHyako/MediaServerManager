import QtQuick
import Frontend.Styles as WorStyles
import Frontend.Controls as WorControls

/**
 *  Item root
 *  - bool canBeMoved: false
 *  - bool canBeResized: false
 *  - int minButtonHeight: 50
 *  - int minButtonWidth: 50
 *  - Item movableScope: null
 *  - bool showCircle: false
 *  - string text: "Button"
 *      | Button
 *          | MouseArea menuMouseArea
 *          | WorControls.ContextMenu contextMenu
 *          | MouseArea transformMouseArea
 *          - numInRange(num, min, max)
 *          - point lastButtonSize: null
 *          - point lastMousePosition: null
 *          - bool resizing: false
 */
WorControls.Button {
    id: rootManagementButton

    property string bindingEvent: ""
    property bool canBeMoved: false
    property bool canBeResized: false
    readonly property int minButtonHeight: 50
    readonly property int minButtonWidth: 50
    property Item movableScope: null
	text: "Button"

    height: WorStyles.ManagementButtonStyle.managementButtonMediumHeight
    width: WorStyles.ManagementButtonStyle.managementButtonMediumWidth

    onClicked: () => {}

    // contentItem: WorControls.TextField
    // {
    // 	opacity: enabled ? 1.0 : 0.3
    // 	text: root.text
    // }

    WorControls.ContextMenu {
        id: contextMenu

        selectedButton: rootManagementButton
    }
    MouseArea {
        id: menuMouseArea

        acceptedButtons: Qt.RightButton
        anchors.fill: parent

        onClicked: mouse => {
            contextMenu.open(Qt.point(mouse.x, mouse.y));
        }
    }
    MouseArea {
        id: transformMouseArea

        property point lastButtonSize: Qt.point(0, 0)
        property point lastMousePosition: Qt.point(0, 0)
        property bool moving: false
        property bool resizing: false

        /**
			 * Return num with min\max limit conditions
			 * @param num number
			 * @param min minimum limit
			 * @param max maximum limit
			 */
        function numInRange(num, min, max) {
            if (num < min) {
                return min;
            } else {
                if (num > max) {
                    return max;
                }
            }
        }

        acceptedButtons: Qt.LeftButton
        anchors.fill: parent

        onClicked: {
            if (rootManagementButton.onClicked !== undefined) {
                rootManagementButton.onClicked();
            }
        }
        onPositionChanged: mouse => {
            if (resizing) {
                if (lastMousePosition === Qt.point(0, 0)) {
                    lastMousePosition = mapToItem(rootManagementButton.movableScope, mouse.x, mouse.y);
                    return;
                }
                var currentMousePosition = mapToItem(rootManagementButton.movableScope, mouse.x, mouse.y);
                var deltaMousePosition = Qt.point(0, 0);
                deltaMousePosition.x = currentMousePosition.x - lastMousePosition.x;
                deltaMousePosition.y = currentMousePosition.y - lastMousePosition.y;
                rootManagementButton.width = numInRange(lastButtonSize.x + deltaMousePosition.x, rootManagementButton.minButtonWidth, rootManagementButton.movableScope.width);
                rootManagementButton.height = numInRange(lastButtonSize.y + deltaMousePosition.y, rootManagementButton.minButtonHeight, rootManagementButton.movableScope.height);
            }
        }
        onPressed: mouse => {
            resizing = rootManagementButton.canBeResized && (mouse.modifiers && Qt.AltModifier);
            moving = rootManagementButton.canBeMoved && (mouse.modifiers && Qt.ControlModifier);
            lastButtonSize.x = rootManagementButton.width;
            lastButtonSize.y = rootManagementButton.height;
        }
        onReleased: {
            resizing = false;
            moving = false;
            lastMousePosition = Qt.point(0, 0);
        }

        drag {
            axis: Drag.XandYAxis
            maximumX: rootManagementButton.movableScope.width - root.width
            maximumY: rootManagementButton.movableScope.height - root.height
            minimumX: 0
            minimumY: 0
            target: transformMouseArea.moving ? rootManagementButton : null
        }
    }
}
