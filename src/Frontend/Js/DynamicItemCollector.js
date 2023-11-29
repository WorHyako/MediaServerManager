/**
 * Collect all children by selected type to list and return it
 * @param parent        Object-parent which children item will collect
 * @returns {*[]|null}  null - selected parent is not QtObject;
 *                      QtObject[] - collected item list
 */
function collectItems(parent) {
    const isHaveChildren = parent.hasOwnProperty('children') && (parent.children.length > 0)
    if (!((parent instanceof QtObject) && isHaveChildren)) {
        return null;
    }
    let items = [];
    const itemNum = parent.children.length;
    for (let i = 0; i < itemNum; ++i) {
        items.push(parent.children[i]);
        console.log(`children[${i}]: Object ${parent.children[i]} with name ${parent.children[i].objectName} was collected`);
    }
    return items;
}
