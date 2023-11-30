import QtQuick

/**
 * Default background for WorControls.
 * In particular, this background is used for <code>WorControl.Button</code>.
 *
 * @author Wor Hyako
 */
Rectangle {
    id: root

	/**
	 * Hovered condition to change background color.
	 */
	property bool hoveredCondition: false

    color: hoveredCondition ? `#F4F4F4` : `#C4C4C4`
    radius: 7

    border {
        color: `#939393`
        width: root.activeFocus ? 2 : 1
    }
}
