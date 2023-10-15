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
	property var addControl: (nameTag, strView) => {
		if (internal.controls === undefined) {
			return false;
		}
		const found = internal.controls.find((element) => {
			return element.name === nameTag;
		});
		console.log(`found: ${found}`);
		if (found !== undefined) {
			return false;
		}
		internal.controls.push({name: nameTag, strView: strView});
		console.log(`control ${nameTag} was added to ManagementControl`);
		return true;
	};

	/**
	 * Return control by index via int or nameTag via string
	 */
	property var getControl: (key) => {
		let control;
		if (Number.isInteger(key)) {
			control = internal.controls[key];
		} else {
			internal.controls.forEach((each) => {
				if (each.name === key) {
					control = each;
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
		const button = WorJs.ItemCreator.getStringifyObject(
			`WorManagementControls`,
			`ManagementButton`,
			``,
			`Management Button`
		);
		root.addControl(`ManagementButton`, button);

		const buttonWithText = WorJs.ItemCreator.getStringifyObject(
			`WorManagementControls`,
			`ManagementButtonWithText`,
			``,
			`Management Button With Text`
		);
		root.addControl(`ManagementButtonWithText`, buttonWithText);

		const table = WorJs.ItemCreator.getStringifyObject(
			`WorManagementControls`,
			`Table`,
			``,
			`Table`
		);
		root.addControl(`Table`, table);

		const editText = WorJs.ItemCreator.getStringifyObject(
			`WorManagementControls`,
			`ManagementTextEdit`,
			``,
			`ManagementTextEdit`
		);
		root.addControl(`ManagementTextEdit`, editText);
	}
}
