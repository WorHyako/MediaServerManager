import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "qrc:/JS/itemCreator.js" as ItemCreator
import "qrc:/Controls" as CustomControls
import "qrc:/Backgrounds" as CustomBackgrounds

/**
 *  Item root
 *      | GridView grid
 *          | Repeater
 *          | ListModel quickButtonModel
 *      | Button addQuickButtonButton
 */
Item {
    id: root
    anchors.fill: parent

    Grid {
        id: grid
        anchors.fill: parent
        columns: 6
        rows: 5
        spacing: 5

        Repeater {
            model: quickButtonModel

            delegate: CustomControls.ManagementButton {
                text: _text
            }
        }
        ListModel {
            id: quickButtonModel
        }
    }
    Button {
        id: addQuickButtonButton
        height: 50
        text: "+"
        width: 50

        background: CustomBackgrounds.ButtonBackgroundRectangle {
            showCircle: false
        }

        onClicked: {
            const rangeCheck = quickButtonModel.count < (grid.columns * grid.rows);
            if (rangeCheck) {
                quickButtonModel.append({
                        "_text": ""
                    });
            }
        }

        anchors {
            bottom: parent.bottom
            right: parent.right
        }
    }
}
