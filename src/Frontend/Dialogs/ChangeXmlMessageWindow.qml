import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQml.Models
import Frontend.Controls as WorControls

/**
 *
 */
Window {
	id: root

	height: 300
	width: 500

	modality: Qt.ApplicationModal

	/**
	 * Object to change this one binding text
	 */
	property QtObject selectedButton: undefined

	/**
	 *
	 */
	function open() {
		const keyValuePairs = selectedButton.commandManagerRef.getCommandPairs();
		keyValuePairs.forEach((pair) => {
			listModel.append({keyText: pair[0], valueText: pair[1]});
		});
		root.show();
	}

	ListModel {
		id: listModel
	}

	Component {
		id: listViewDelegate

		RowLayout {
			height: 30
			spacing: 4

			/**
			 * Accessor to key field text
			 * @returns {string} key field text
			 */
			function getKey(): string {
				return key.text;
			}

			/**
			 * Accessor to value field text
			 * @returns {string} value field text
			 */
			function getValue(): string {
				return value.text;
			}

			WorControls.EditTextField {
				id: key
				text: keyText
			}

			WorControls.EditTextField {
				id: value
				text: valueText
			}

			WorControls.Button {
				width: 30
				height: 30
				contextMenuEnable: false
				text: `-`
				onLeftClicked: () => {
					listModel.remove(index, 1);
				}
			}
		}
	}
	ColumnLayout {
		anchors.fill: parent

		ScrollView {
			Layout.fillWidth: true
			Layout.preferredHeight: 210
			ListView {
				id: listView
				anchors.fill: parent
				model: listModel
				delegate: listViewDelegate
			}
		}

		WorControls.Button {
			width: 70
			height: 20
			text: `Add`
			contextMenuEnable: false
			onLeftClicked: () => {
				listModel.append({keyText: `key`, valueText: `value`});
			}
		}

		WorControls.Button {
			contextMenuEnable: false
			width: 100
			height: 20
			text: `Apply`

			onLeftClicked: () => {
				if (root.selectedButton === undefined) {
					return;
				}
				let pairList = [];
				for (let i = 0; i < listModel.count; ++i) {
					const key = listView.itemAtIndex(i).getKey();
					const value = listView.itemAtIndex(i).getValue();
					pairList.push([key, value]);
				}
				if (root.selectedButton.commandManagerRef.makeCommand(pairList)) {
					root.close();
					root.destroy();
				}
			}
		}
	}
}
