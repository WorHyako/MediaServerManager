import QtQuick
import Frontend.Controls as WorControls
import Frontend.Js as Js

/**
 *  Item root
 *  - int maxElementNum
 *  - var newElementArgs : {}
 *  - string qrcElementPath
 *  - QtObject scopeObject
 *  - bool showCircle: false
 *      | Button
 */
WorControls.Button {
    id: root

    required property int maxElementNum
    property var newElementArgs: {
    }
    required property var qrcElementPath
    required property QtObject scopeObject

    height: 50
    text: "Add"
    width: 50

    onLeftClicked: () => {
        const rangeCheck = root.scopeObject.children.length < root.maxElementNum;
        if (rangeCheck) {
            Js.ItemCreator.createNewItem(root.qrcElementPath, root.scopeObject, root.newElementArgs);
        }
    }

    anchors {
        bottom: parent.bottom
        right: parent.right
    }
}
