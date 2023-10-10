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
	property var addControl: (control, nameTag, strView) => {
		if (internal.controls === undefined) {
			return false;
		}
		const found = internal.controls.find((element) => {
			return element.name === nameTag;
		});
		if (found !== undefined) {
			return false;
		}
		internal.controls.push({name: nameTag, control: control, strView: strView});
		console.log(`control: ${control}\n
			stringView: ${strView}\n
			nameTag: ${nameTag}`);
		console.log(`controls length ${internal.controls.length}`);
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

		const table = WorJs.ItemCreator.createItem(
			`WorControls`,
			`Table`,
			``,
			root,
			`Table`
		);
		internal.controls[0] = ["ManagementButton", button];
		internal.controls.push(["ManagementButtonWithText", buttonWithText]);
		internal.controls.push(["Table", table]);
	}
}
