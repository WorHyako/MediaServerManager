import QtQuick

/**
 *
 */
Rectangle {
    id: root

	/**
	 * Show background has color effect on mouse hovering
	 */
	property bool hoveredCondition: false

    color: hoveredCondition ? `#F4F4F4` : `#C4C4C4`
    radius: 7

    border {
        color: `#939393`
        width: root.activeFocus ? 2 : 1
    }
}
