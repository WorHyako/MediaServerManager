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
Item {
    id: root

    property string bindingEvent: ""
    property bool canBeMoved: false
    property bool canBeResized: false
    readonly property int minButtonHeight: 50
    readonly property int minButtonWidth: 50
    property Item movableScope: null
    property var onClicked: undefined
    property bool showCircle: false
    property string text: "Button"

    height: WorStyles.ManagementButtonStyle.managementButtonMediumHeight
    width: WorStyles.ManagementButtonStyle.managementButtonMediumWidth

    WorControls.Button {
        anchors.fill: parent
        text: root.text

        onClicked: () => {}

        // contentItem: WorControls.TextField
        // {
        // 	opacity: enabled ? 1.0 : 0.3
        // 	text: root.text
        // }

        WorControls.ContextMenu {
            id: contextMenu

            selectedButton: root
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
                if (root.onClicked !== undefined) {
                    root.onClicked();
                }
            }
            onPositionChanged: mouse => {
                if (resizing) {
                    if (lastMousePosition === Qt.point(0, 0)) {
                        lastMousePosition = mapToItem(root.movableScope, mouse.x, mouse.y);
                        return;
                    }
                    var currentMousePosition = mapToItem(root.movableScope, mouse.x, mouse.y);
                    var deltaMousePosition = Qt.point(0, 0);
                    deltaMousePosition.x = currentMousePosition.x - lastMousePosition.x;
                    deltaMousePosition.y = currentMousePosition.y - lastMousePosition.y;
                    root.width = numInRange(lastButtonSize.x + deltaMousePosition.x, root.minButtonWidth, root.movableScope.width);
                    root.height = numInRange(lastButtonSize.y + deltaMousePosition.y, root.minButtonHeight, root.movableScope.height);
                }
            }
            onPressed: mouse => {
                resizing = root.canBeResized && (mouse.modifiers && Qt.AltModifier);
                moving = root.canBeMoved && (mouse.modifiers && Qt.ControlModifier);
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
}
