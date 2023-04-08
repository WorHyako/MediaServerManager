import QtQuick
import QtQuick.Controls
import "qrc:/Styles" as CustomStyles
import "qrc:/Backgrounds" as CustomBackgrounds
import "qrc:/Controls" as CustomControls

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
 *          | MouseArea transformMouseArea
 *          - numInRange(num, min, max)
 *          - point lastButtonSize: null
 *          - point lastMousePosition: null
 *          - bool resizing: false
 */
Item {
    id: root

    property bool canBeMoved: false
    property bool canBeResized: false
    readonly property int minButtonHeight: 50
    readonly property int minButtonWidth: 50
    property Item movableScope: null
    property bool showCircle: false
    property string text: "Button"
    property string bindingEvent: "" 

    height: CustomStyles.ManagementButtonStyle.managementButtonMediumHeight
    width: CustomStyles.ManagementButtonStyle.managementButtonMediumWidth

    Button {
        anchors.fill: parent
        height: parent.height
        width: parent.width

        background: CustomBackgrounds.ButtonBackgroundRectangle {
            showCircle: root.showCircle
        }
        contentItem: Text {
            color: CustomStyles.FontStyle.fontColor
            horizontalAlignment: Text.AlignHCenter
            opacity: enabled ? 1.0 : 0.3
            text: root.text
            verticalAlignment: Text.AlignVCenter

            font {
                family: CustomStyles.FontStyle.fontFamily
                pointSize: CustomStyles.FontStyle.fontSize
            }
        }

        CustomControls.ContextMenu {
            id: contextMenu
            selectedButton: root
        }
        MouseArea {
            id: menuMouseArea
            acceptedButtons: Qt.RightButton
            anchors.fill: parent

            onClicked: {
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
                return num;
            }

            acceptedButtons: Qt.LeftButton
            anchors.fill: parent

            onPositionChanged: {
                if (resizing) {
                    if (lastMousePosition == Qt.point(0, 0)) {
                        lastMousePosition = mapToItem(movableScope, mouse.x, mouse.y);
                        return;
                    }
                    var currentMousePosition = mapToItem(movableScope, mouse.x, mouse.y);
                    var deltaMousePosition = Qt.point(0, 0);
                    deltaMousePosition.x = currentMousePosition.x - lastMousePosition.x;
                    deltaMousePosition.y = currentMousePosition.y - lastMousePosition.y;
                    root.width = numInRange(lastButtonSize.x + deltaMousePosition.x, root.minButtonWidth, root.movableScope.width);
                    root.height = numInRange(lastButtonSize.y + deltaMousePosition.y, root.minButtonHeight, root.movableScope.height);
                }
            }
            onPressed: {
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
                target: moving ? root : null
            }
        }
    }
}
