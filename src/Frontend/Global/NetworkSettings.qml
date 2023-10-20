pragma Singleton

import QtQuick

/**
 *
 */
Item {
	id: root

	/**
	 * Private variables and objects
	 */
	QtObject {
		id: internal

		/**
		 * Available endpoints via [{ip: x, port: x}, ...]
		 */
		property var endpoints: []
	}
}
