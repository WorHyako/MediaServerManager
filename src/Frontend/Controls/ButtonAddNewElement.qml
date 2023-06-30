import QtQuick
import Frontend.Controls as WorControls
import Frontend.Js as WorJs

/**
 * Object based on WorControls.Button to create new elements
 *
 * ---
 *
 *  WorControls.Button (root)
 *  - int maxElementNum
 *  - var newElementArgs : {}
 *  - string qrcElementPath
 *  - QtObject scopeObject
 */
WorControls.Button {
	id: root

	required property int maxElementNum
	property var newElementArgs: {
	}
	required property string qrcElementPath
	required property QtObject scopeObject

	height: 50
	text: "Add"
	width: 50

	onLeftClicked: () => {
		const rangeCheck = root.scopeObject.children.length < root.maxElementNum;
		if (rangeCheck) {
			WorJs.ItemCreator.createNewItem(root.qrcElementPath, root.scopeObject, root.newElementArgs);
		}
	}

	anchors {
		bottom: parent.bottom
		right: parent.right
	}
}
