import QtQuick
import QtQuick.Controls
import Frontend.Backgrounds as WorBackgrounds
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
Item {
	id: root

	required property int maxElementNum
	property var newElementArgs: {
	}
	required property var qrcElementPath
	required property QtObject scopeObject

	height: 50
	width: 50

	anchors {
		bottom: parent.bottom
		right: parent.right
	}
	WorControls.Button {
		anchors.fill: parent
		text: "Add"

		onClicked: () => {
			const rangeCheck = root.scopeObject.children.length < root.maxElementNum;
			if (rangeCheck) {
				Js.ItemCreator.createNewItem(root.qrcElementPath, root.scopeObject, root.newElementArgs);
			}
		}
	}
}
