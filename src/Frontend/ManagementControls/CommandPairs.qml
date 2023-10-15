import QtQuick
import Frontend.QmlObjects.Command as WorCommands

/**
 * Object to manage all communication with media server via XML commands
 */
Item {
	id: root

	/**
	 * XML command to send to media manager
	 */
	property string bindingEvent: qmlCommandSender.commandText

	/**
	 * Internal item to send XML command. Var to easily accessing
	 */
	property var commandSender: root.qmlCommandSender

	/**
	 * Private variables and objects
	 */
	QtObject {
		id: internal

		/**
		 * Pairs to generate XML message to media serve
		 */
		property var commandPairs: []
	}

	/**
	 * Send current XML command to media server
	 */
	function sendCommand() {
		qmlCommandSender.sendCommand();
	}

	/**
	 * Return command pairs
	 */
	function getCommandPairs() {
		return internal.commandPairs;
	}

	/**
	 *
	 * @param commandPairs
	 * @returns {boolean}
	 */
	function makeCommand(commandPairs): boolean {
		if (!(Array.isArray(commandPairs) && Array.isArray(commandPairs[0]))) {
			return false;
		}
		internal.commandPairs = commandPairs;
		const makingResult = qmlCommandSender.makeCommand(commandPairs);
		return makingResult;
	}

	WorCommands.QmlCommandSender {
		id: qmlCommandSender
	}
}
