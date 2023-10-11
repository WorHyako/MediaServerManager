/**
 * Create new QtQuick Item, attach to parent and give args list to this one
 * @param qrcScope      Module which contain item. F.e. QtQuick.Controls or WorControls
 * @param itemName      Item qml name. F.e. Rectangle from QtQuick.Controls or ManagementButton from WorControls
 * @param objectName    Object name for item
 * @param args          Parameters to created item
 * @param parent        Created item's parent object
 * @returns {*}         Created object
 */
function createItem(qrcScope, itemName, args, parent, objectName) {
    const objectViaString = getStringifyObject(qrcScope, itemName, args, objectName);
    console.log("object to create: ", objectViaString);
    return Qt.createQmlObject(objectViaString, parent, objectName);
}

/**
 *
 * @param stringifyView
 * @param parent
 * @param objectName
 * @returns {*}
 */
function createItemStr(stringifyView, parent, objectName) {
    console.log("object to create: ", stringifyView);
    return Qt.createQmlObject(stringifyView, parent, objectName);
}

/**
 *
 * @param qrcScope
 * @param itemName
 * @param args
 * @param objectName
 * @returns {string}
 */
function getStringifyObject(qrcScope, itemName, args, objectName) {
    const isWorScope = qrcScope.includes("Wor");
    const scopeName = isWorScope
        ? qrcScope.slice(3)
        : '';
    return `import QtQuick
        import QtQuick.Controls
        ${isWorScope
        ? `import Frontend.${scopeName} as ${qrcScope}`
        : `import ${qrcScope}`}
        
		${isWorScope
        ? `${qrcScope}.${itemName}`
        : itemName} {
		    id: root
		    objectName: "${objectName}"
		    ${args}
		}`;
}
