pragma Singleton

import QtQuick
import Frontend.Js as WorJs

/**
 * Class contain list of unique management controls, that can be placed on management scope
 */
Item {
	id: root

	/**
	 * Function to add new unique control
	 */
	property var addControl: (control, nameTag) => {
		if(internal.controls !== undefined) {
			var found = internal.controls.find((element) => {
				return element.name === nameTag;
			});
		}
		console.log(`in addControl`);
		console.log(found);
		if (found !== undefined) {
			return false;
		}
		internal.controls.push({name: nameTag, control: control});
		console.log("control:", control);
		console.log("nameTag:", nameTag);
		console.log(`controls length ${internal.controls.length}`);
		console.log(`controls.name ${internal.controls[0].name}, controls.control ${internal.controls[0].control}`);
		return true;
	};

	/**
	 * Return control by index via int or nameTag via string
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
			});
		}
		return control;
	}

	/**
	 * Return all available controls
	 */
	property var getAllControls: () => {
		return internal.controls;
	}

	/**
	 * Private variables and objects
	 */
	QtObject {
		id: internal

		/**
		 * List of available controls
		 */
		property var controls: []
	}

	Component.onCompleted: {
		const button = WorJs.ItemCreator.createItem(
			`WorControls`,
			`ManagementButton`,
			``,
			root,
			`Management Button`
		);

		const buttonWithText = WorJs.ItemCreator.createItem(
			`WorControls`,
			`ManagementButtonWithText`,
			``,
			root,
			`Management Button With Text`
		);
		internal.controls[0] = ["ManagementButton", button];
		internal.controls.push(["ManagementButtonWithText", buttonWithText]);
	}
}
