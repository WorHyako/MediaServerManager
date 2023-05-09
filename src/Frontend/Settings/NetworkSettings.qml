import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "qrc:/Controls" as CustomControls
import "qrc:/Backgrounds" as CustomBackgrounds
import "qrc:/Styles" as CustomStyles

/**
 *  Item root
 *      | RowLayout
 */
Item {
    id: root
    ColumnLayout {
        anchors.fill: parent

        RowLayout {
            CustomBackgrounds.TextBackgroundRectangle {
                height: 30
                width: 100

                CustomControls.TextField {
                    text: "Destination ip"
                }
            }
            CustomControls.EditTextField {
                id: destinationIpTextEdit
            }
        }
        RowLayout {
            CustomBackgrounds.TextBackgroundRectangle {
                height: 30
                width: 100

                CustomControls.TextField {
                    text: "Destination port"
                }
            }
            CustomControls.EditTextField {
                id: destinationPortTextEdit
            }
        }
    }
    Button {
        text: "Apply"

        background: CustomBackgrounds.ButtonBackgroundRectangle {
            showCircle: false
        }

        anchors {
            bottom: parent.bottom
            bottomMargin: 50
            right: parent.right
            rightMargin: 50
        }
    }
}
