import QtQuick
import QtQuick.Controls
import "qrc:/Controls" as CustomControls
import "qrc:/Backgrounds" as CustomBackgrounds
import "qrc:/JS/itemCreator.js" as ItemCreator

/**
 *  Item root
 *  - int maxElementNum
 *  - var newElementArgs : {}
 *  - string qrcElementPath
 *  - QtObject scopeObject
 *  - bool showCircle: false
 *      | Button
 */
Item {
    id: root

    required property int maxElementNum
    property var newElementArgs: {
    }
    required property string qrcElementPath
    required property QtObject scopeObject

    height: 50
    width: 50

    anchors {
        bottom: parent.bottom
        right: parent.right
    }
    Button {
        anchors.fill: parent
        text: "Add"

        background: CustomBackgrounds.ButtonBackgroundRectangle {
            showCircle: false
        }

        onClicked: {
            const rangeCheck = root.scopeObject.children.length < root.maxElementNum;
            if (rangeCheck) {
                ItemCreator.createNewItem(root.qrcElementPath, root.scopeObject, root.newElementArgs);
            }
        }
    }
}
