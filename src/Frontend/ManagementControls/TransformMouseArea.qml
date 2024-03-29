import QtQuick
import QtQuick.Controls

/**
 *
 */
MouseArea {
	id: root

	/**
	 * Can object be moved or not
	 */
	property bool canBeMoved: false

	/**
	 * Can object be resized or not
	 */
	property bool canBeResized: false

	/**
	 * Event on mouse left click
	 */
	property var onLeftClicked: undefined

	/**
	 * Scope, where object can move and resize
	 */
	required property var movableScope

	/**
	 * Object that should move or resize
	 */
	property var target: parent

	/**
	 * Private variables and objects
	 */
	QtObject {
		id: internal

		/**
		 *
		 */
		property point lastButtonSize: Qt.point(0, 0)

		/**
		 *
		 */
		property point lastMousePosition: Qt.point(0, 0)

		/**
		 * Flag that indicates whether the object is moving now
		 */
		property bool moving: false

		/**
		 * Flag that indicates whether the object is resizing now
		 */
		property bool resizing: false
	}

	/**
	 * Return num with min\max limit conditions
	 * @param num number
	 * @param min minimum limit
	 * @param max maximum limit
	 */
	function numInRange(num: int, min: int, max: int): int {
		let result = num;
		if (num < min) {
			result = min;
		} else {
			if (num > max) {
				result = max;
			}
		}
		return result;
	}

	acceptedButtons: Qt.LeftButton
	anchors.fill: root.parent

	onClicked: {
		if (root.onLeftClicked === undefined) {
			return;
		}
		root.onLeftClicked();
	}

	onPositionChanged: mouse => {
		if (internal.resizing) {
			if (internal.lastMousePosition === Qt.point(0, 0)) {
				internal.lastMousePosition = mapToItem(root.movableScope, mouse.x, mouse.y);
				return;
			}
			const currentMousePosition = mapToItem(root.movableScope, mouse.x, mouse.y);
			const deltaMousePosition = Qt.point(0, 0);
			deltaMousePosition.x = currentMousePosition.x - internal.lastMousePosition.x;
			deltaMousePosition.y = currentMousePosition.y - internal.lastMousePosition.y;
			const minWidth = 50
			const minHeight = 50
			const newWidth = numInRange(internal.lastButtonSize.x + deltaMousePosition.x, internal.minButtonWidth, root.movableScope.width);
			const newHeight = numInRange(internal.lastButtonSize.y + deltaMousePosition.y, internal.minButtonHeight, root.movableScope.height);
			root.target.width = newWidth < minWidth ? minWidth : newWidth;
			root.target.height = newHeight < minHeight ? minHeight : newHeight;
		}
	}

	onPressed: mouse => {
		internal.resizing = !!(root.canBeResized && (mouse.modifiers & Qt.AltModifier));
		internal.moving = !!(root.canBeMoved && (mouse.modifiers & Qt.ControlModifier));
		internal.lastButtonSize.x = root.target.width;
		internal.lastButtonSize.y = root.target.height;
	}

	onReleased: {
		internal.resizing = false;
		internal.moving = false;
		internal.lastMousePosition = Qt.point(0, 0);
	}

	drag {
		axis: Drag.XandYAxis
		maximumX: root.movableScope.width - root.target.width
		maximumY: root.movableScope.height - root.target.height
		minimumX: 0
		minimumY: 0
		target: internal.moving ? root.target : undefined
	}
}
