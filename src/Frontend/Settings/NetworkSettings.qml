import QtQuick
import QtQuick.Layouts
import Frontend.Controls as WorControls
import Frontend.Backgrounds as WorBackgrounds
import Frontend.QmlObjects.Network as WorNetwork

/**
 *
 */
Item {
	id: root

	Column {
		id: listLayout
		anchors {
			left: parent.left
			top: parent.top
			bottom: parent.bottom
		}
		width: 120

		spacing: 20

		Repeater {
			id: repeater
			model: 1

			ColumnLayout {

				GridLayout {
					Layout.fillWidth: true
					rows: 2
					columns: 3

					WorBackgrounds.TextBackgroundRectangle {
						height: 30
						width: 50

						Layout.row: 0
						Layout.column: 0
						WorControls.Text {
							text: `Ip`
						}
					}

					WorControls.EditTextField {
						Layout.row: 0
						Layout.column: 1
						id: destinationIpTextEdit
						text: `127.0.0.1`
					}

					WorBackgrounds.TextBackgroundRectangle {
						height: 30
						width: 50
						Layout.row: 1
						Layout.column: 0

						WorControls.Text {
							text: `Port`
						}
					}

					WorControls.EditTextField {
						id: destinationPortTextEdit
						text: `7000`
						Layout.row: 1
						Layout.column: 1
					}

					WorControls.Button {
						Layout.row: 0
						Layout.column: 2
						width: 30
						height: 30
						text: `-`
						onLeftClicked: () => {
							repeater.model -= 1;
						}
					}

					Rectangle {
						id: circle

						readonly property var goodColor: `#65db81`
						readonly property var badColor: `#db6565`

						function changeColor(isGreen) {
							circle.color = isGreen ? goodColor : badColor;
						}

						width: 30
						height: 30
						radius: 15
						color: `#db6565`

						MouseArea {
							anchors.fill: parent
							onClicked: (mouse) => {
								const ip = destinationIpTextEdit.text;
								const port = destinationPortTextEdit.port;
								const result = WorNetwork.QmlSocketManager.add(ip, port, index);
								circle.changeColor(result);
							}
						}
					}
				}
			}
		}
		WorControls.Button {
			id: addNewItem
			width: 50
			height: 50
			text: `+`
			onLeftClicked: () => {
				repeater.model += 1;
			}
		}
	}
}
