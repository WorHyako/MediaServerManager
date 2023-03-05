import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "qrc:/Backgrounds" as CustomBackgrounds
import "qrc:/Controls" as CustomControls

/**
 * Dialog root
 * - string newText: "-"
 * - string previousText: "-"
 * - onTextEditFinished(text)
 *      | ColumnLayout
 *          | Text
 *          | Repeater
 *          - model: [["Previous", root.previousText], ["New", root.newText]]
 *              | Text
 *              | Rectangle
 *              | TextEdit
 *          | Button
 */
Dialog {
    id: root

    property string newText: "-"
    required property string previousText

    /// TODO: Make binding between TextEdit and property newText
    /**
     * Function exist just by one reason. Damned TextEdit in Repeater can't find "root" id
     * @param text  New text
     */
    function onTextEditFinished(text) {
        root.newText = text;
    }

    height: 250
    width: 350

    background: Rectangle {
        anchors.fill: parent
        border.color: "#444"
        border.width: 4
        color: "#a4a4a4"
        radius: 10
    }

    ColumnLayout {
        height: root.height * 0.8
        spacing: 5
        width: root.width * 0.8

        anchors {
            bottomMargin: 10
            fill: parent
            leftMargin: 10
            rightMargin: 10
            topMargin: 10
        }
        Text {
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            text: "Renaming window"
            verticalAlignment: Text.AlignVCenter
        }
        Repeater {
            id: repeater
            model: [["Previous", root.previousText], ["New", root.newText]]

            CustomBackgrounds.TextBackgroundRectangle {
                Layout.alignment: Qt.AlignCenter
                Layout.preferredHeight: 50
                Layout.preferredWidth: root.width * 0.9

                RowLayout {
                    anchors.fill: parent

                    Text {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        text: modelData[0]
                        verticalAlignment: Text.AlignVCenter
                    }
                    Rectangle {
                        Layout.fillHeight: true
                        color: "#222"
                        width: 1
                    }
                    TextEdit {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Layout.maximumWidth: 220
                        Layout.minimumWidth: 20
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        readOnly: index === 0
                        text: modelData[1]
                        verticalAlignment: Text.AlignVCenter

                        onEditingFinished: {
                            onTextEditFinished(text);
                        }
                    }
                }
            }
        }
        CustomControls.ManagementButton {
            Layout.alignment: Qt.AlignCenter
            text: "Apply"

            MouseArea {
                acceptedButtons: Qt.LeftButton
                anchors.fill: parent

                onClicked: {
                    focus = true;
                    /// TODO: Connect and return newText via onAccepted or onApplied event
                    root.parent.renameApplied(root.newText);
                    root.accept();
                }
            }
        }
    }
}
