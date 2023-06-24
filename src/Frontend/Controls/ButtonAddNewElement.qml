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
    id: rootButtonAddNewElement

    required property int maxElementNum
    property var newElementArgs: {
    }
    required property var qrcElementPath
    required property QtObject scopeObject

    height: 50
    text: "Add"
    width: 50

    onClicked: () => {
        const rangeCheck = rootButtonAddNewElement.scopeObject.children.length < rootButtonAddNewElement.maxElementNum;
        if (rangeCheck) {
            Js.ItemCreator.createNewItem(rootButtonAddNewElement.qrcElementPath, rootButtonAddNewElement.scopeObject, rootButtonAddNewElement.newElementArgs);
        }
    }

    anchors {
        bottom: parent.bottom
        right: parent.right
    }
}
