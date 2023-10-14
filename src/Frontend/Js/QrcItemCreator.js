/**
 * Create new QtQuick Item, attach to rootItem and give parameter list to this one
 * @param itemPath          Item path which will created via `qrc:/`
 * @param rootItem          Created item's parent object
 * @param parameters        Parameters to created item
 * @returns {undefined|{}}  Created object
 */
function createNewItem(itemPath, rootItem, parameters) {
    const component = Qt.createComponent(itemPath);
    let item = {};
    if (component.status === Component.Ready) {
        item = parameters === undefined
            ? component.createObject(rootItem)
            : component.createObject(rootItem, parameters);
        if (item == null) {
            console.log(`Object ${item} can't be created`);
            return undefined;
        }
        if (item instanceof ApplicationWindow) {
            item.show();
        }
    } else {
        console.log(`ErrorString: ${component.errorString()}`);
    }
    console.log(`Item ${item} was created`);
    return item;
}
