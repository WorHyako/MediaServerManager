import QtQuick
import Frontend.ManagementControls as WorManagementControls
import Frontend.Controls as WorControls
import Frontend.Js as WorJs
import Frontend.Backgrounds as WorBackgrounds
import Frontend.Global as WorGlobal

/**
 *
 */
Window {
	id: root

	modality: Qt.ApplicationModal

	width: 200
	height: 150

	minimumHeight: 250
	minimumWidth: 300

	/**
	 * New created element
	 */
	property var newElement: undefined

	Item {
		id: mouseArea
		anchors.fill: parent

		WorManagementControls.TransformMouseArea {
			canBeResized: true
			movableScope: mouseArea
			target: elementScope
		}
	}

	WorBackgrounds.ButtonBackgroundRectangle {
		id: elementScope
		width: 200
		height: 100
		anchors {
			horizontalCenter: parent.horizontalCenter
			top: parent.top
		}
	}

	WorControls.ButtonAddNewElement {
		id: buttonAddNewElement
		scopeObject: elementScope
	}

	WorControls.EditTextField {
		id: controlName

		anchors {
			horizontalCenter: parent.horizontalCenter
			bottom: parent.bottom
		}
	}

	WorControls.Button {
		width: 50
		height: 30
		anchors {
			left: parent.left
			bottom: parent.bottom
		}
		text: `Save`
		onLeftClicked: () => {
			const item = `import QtQuick
				import Frontend.ManagementControls as WorManagementControls
				import Frontend.Backgrounds as WorBackgrounds
				
				WorBackgrounds.ButtonBackgroundRectangle {
					id: root
					
					property var movableScope: undefined
					
					width: ${elementScope.width}
					height: ${elementScope.height}
					
					WorManagementControls.TransformMouseArea {
						canBeMoved: true
						movableScope: root.movableScope
						target: root
					}
				}`;
			let controlList = [item];
			elementScope.children.forEach((child) => {
				const element = WorJs.ItemCreator.getStringifyObject(
					`WorManagementControls`,
					`${child.objectName}`,
					`x: ${child.x}
					y: ${child.y}`,
					`${child.objectName}`
				);
				controlList.push(element);

			});
			const itemName = controlName.text.replace(/\s/g,'');
			WorGlobal.ManagementControls.addControl(itemName, controlList);
			buttonAddNewElement.reset();
			root.close();
			root.destroy();
		}
	}
}
