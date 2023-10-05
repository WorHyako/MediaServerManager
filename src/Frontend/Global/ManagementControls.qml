pragma Singleton

import QtQuick

/**
 * Class contain list of unique management controls, that can be placed on management scope
 */
Item {
	id: root

	/**
	 * Function to add new unique control
	 */
	property var addControl: (control, nameTag) => {
		console.log("controls length: ", internal.controls.length);
		console.log("controls: ", internal.controls);
		console.log("nameTag: ", nameTag);
		var found = internal.controls.find((element) => {
			console.log("in find body");
			console.log(nameTag);
			return element.name === nameTag;
		});
		if (found === undefined) {
			return false;
		}
		internal.controls.push({name: nameTag, control: control});
		console.log(internal.controls[0].name)
		return true;
	};

	/**
	 *
	 */
	property var getControl: (key) => {
		let control;
		if (Number.isInteger(key)) {
			control = internal.controls[key].name;
		} else {
			internal.controls.forEach((each) => {
				if (each.hasOwnProperty(key)) {
					return each.name;
				}
			})
		}
		return control;
	}

	QtObject {
		id: internal

		/**
		 * List of available controls
		 */
		property var controls: []
	}
}
