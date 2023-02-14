import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ManagementButtonStyle 1.0
import FontStyle 1.0

/**
 *  Item root
 *  - bool canBeMoved: false
 *  - bool canBeResized: false
 *  - Item movableScope: null
 *  - bool showCircle: false
 *  - string text: "Button"
 *      | Button managementButton
 *      - int minButtonHeight: 50
 *      - int minButtonWidth: 50
 *          | MouseArea transformMouseArea
 *          - point lastButtonSize: null
 *          - point lastMousePosition: null
 *          - bool resizing: false
 */
Item {
    id: root

    property bool canBeMoved: false
    property bool canBeResized: false
    property Item movableScope: null
    property bool showCircle: false
    property string text: "Button"

    height: ManagementButtonStyle.managementButtonMediumHeight
    width: ManagementButtonStyle.managementButtonMediumWidth

    Button {
        id: managementButton

        readonly property int minButtonHeight: 50
        readonly property int minButtonWidth: 50

        Layout.fillWidth: true
        height: parent.height
        text: parent.text
        width: parent.width

        background: ButtonBackgroundRectangle {
            showCircle: root.showCircle
        }
        contentItem: Text {
            color: FontStyle.fontColor
            font.family: FontStyle.fontFamily
            font.pointSize: FontStyle.fontSize
            horizontalAlignment: Text.AlignHCenter
            opacity: enabled ? 1.0 : 0.3
            text: managementButton.text
            verticalAlignment: Text.AlignVCenter
        }

        MouseArea {
            id: transformMouseArea

            property point lastButtonSize: null
            property point lastMousePosition: null
            property bool resizing: false

            /**
             * Return num with min\max limit conditions
             * @param num number
             * @param min minimum limit
             * @param max maximum limit
             */
            function numInRange(num, min, max) {
                console.log("num: " + num + "; min: " + min);
                if (num < min) {
                    return min;
                } else if (num > max) {
                    return max;
                }
                return num;
            }

            acceptedButtons: Qt.RightButton
            anchors.fill: parent

            onPositionChanged: {
                if (resizing) {
                    if (lastMousePosition == Qt.point(0, 0) || lastMousePosition == null) {
                        lastMousePosition = mapToItem(movableScope, mouse.x, mouse.y);
                        return;
                    }
                    var currentMousePosition = mapToItem(movableScope, mouse.x, mouse.y);
                    var deltaMousePosition = Qt.point(0, 0);
                    deltaMousePosition.x = currentMousePosition.x - lastMousePosition.x;
                    deltaMousePosition.y = currentMousePosition.y - lastMousePosition.y;
                    managementButton.width = numInRange(lastButtonSize.x + deltaMousePosition.x, managementButton.minButtonWidth, root.movableScope.width);
                    managementButton.height = numInRange(lastButtonSize.y + deltaMousePosition.y, managementButton.minButtonHeight, root.movableScope.height);
                }
            }
            onPressed: {
                resizing = mouse.modifiers & Qt.AltModifier;
                root.canBeMoved = !resizing;
                lastButtonSize.x = managementButton.width;
                lastButtonSize.y = managementButton.height;
            }
            onReleased: {
                resizing = false;
                root.canBeMoved = true;
                lastMousePosition = Qt.point(0, 0);
            }

            drag {
                axis: Drag.XandYAxis

                /**
                 * with anchor.centerIn: parent
                 */
                // maximumX: root.movableScope.width / 2 - managementButton.width / 2
                // maximumY: root.movableScope.height / 2 - managementButton.height / 2
                // minimumX: -root.movableScope.width / 2 + managementButton.width / 2
                // minimumY: -root.movableScope.height / 2 + managementButton.height / 2
                /**
                 * and without
                 */
                maximumX: root.movableScope.width - managementButton.width
                maximumY: root.movableScope.height - managementButton.height
                minimumX: 0
                minimumY: 0
                target: root.canBeMoved ? parent : null
            }
        }
    }
}