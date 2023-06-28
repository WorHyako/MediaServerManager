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
    id: root

    property string bindingEvent: ""
    property bool canBeMoved: false
    property bool canBeResized: false
    readonly property int minButtonHeight: 50
    readonly property int minButtonWidth: 50
    property Item movableScope: undefined

    height: WorStyles.ManagementButtonStyle.managementButtonMediumHeight
    text: "Button"
    width: WorStyles.ManagementButtonStyle.managementButtonMediumWidth

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
        function numInRange(num: int, min: int, max: int): int {
            let result = num;
            if (num < min) {
                result = min;
            } else {
                if (num > max) {
                    result = max;
                }
            }
            return result;
        }

        acceptedButtons: Qt.LeftButton
        anchors.fill: parent

        onClicked: {
            root.leftClick();
        }
        onPositionChanged: mouse => {
            if (resizing) {
                if (lastMousePosition === Qt.point(0, 0)) {
                    lastMousePosition = mapToItem(root.movableScope, mouse.x, mouse.y);
                    return;
                }
                const currentMousePosition = mapToItem(root.movableScope, mouse.x, mouse.y);
                const deltaMousePosition = Qt.point(0, 0);
                deltaMousePosition.x = currentMousePosition.x - lastMousePosition.x;
                deltaMousePosition.y = currentMousePosition.y - lastMousePosition.y;
                root.width = numInRange(lastButtonSize.x + deltaMousePosition.x, root.minButtonWidth, root.movableScope.width);
                root.height = numInRange(lastButtonSize.y + deltaMousePosition.y, root.minButtonHeight, root.movableScope.height);
            }
        }
        onPressed: mouse => {
            resizing = root.canBeResized && (mouse.modifiers & Qt.AltModifier);
            moving = root.canBeMoved && (mouse.modifiers & Qt.ControlModifier);
            lastButtonSize.x = root.width;
            lastButtonSize.y = root.height;
        }
        onReleased: {
            resizing = false;
            moving = false;
            lastMousePosition = Qt.point(0, 0);
        }

        drag {
            axis: Drag.XandYAxis
            maximumX: root.movableScope.width - root.width
            maximumY: root.movableScope.height - root.height
            minimumX: 0
            minimumY: 0
            target: transformMouseArea.moving ? root : null
        }
    }
}
