/**
 *
 * @param qrcScope
 * @param itemName
 * @param objectName
 * @param args
 * @param parent
 * @returns {*}
 */
function createItem(qrcScope, itemName, args, parent, objectName) {
    const objectViaString = getStringifyObject(qrcScope, itemName, args, objectName);
    console.log("object to create: ", objectViaString);
    return Qt.createQmlObject(objectViaString, parent, objectName);
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

// /**
//  *
//  * @param controlName
//  * @param controlId
//  * @param args
//  * @returns {string}
//  */
// function getStringifyElement(controlName, controlId, args = ``) {
//     return `
//     import
//     WorControls.${controlName} {
//         id: "${controlId}"
//         ${args}
//     }`;
// }
