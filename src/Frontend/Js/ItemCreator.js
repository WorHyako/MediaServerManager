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
    let isWorScope = qrcScope.includes("Wor");
    const scopeName = isWorScope
        ? qrcScope.slice(3)
        : '';
    const objectViaString = `
        import QtQuick;
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
    console.log("object to create: ", objectViaString);
    return Qt.createQmlObject(objectViaString, parent, objectName);
}
