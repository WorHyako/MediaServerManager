/**
 * Collect all children by selected type to list and return it
 * @param parent        Object-parent which children item will collect
 * @param type          Type of children which should collected
 * @returns {*[]|null}  null - selected parent is not QtObject;
 *                      QtObject[] - collected item list
 */
function collectItems(parent, type) {
    const isHaveChildren = parent.hasOwnProperty('children') && (parent.children.length > 0)
    if (!((parent instanceof QtObject) && isHaveChildren)) {
        return null;
    }
    let items = [];
    const itemNum = parent.children.length;
    console.log("item num:", itemNum);
    for (let i = 0; i < itemNum; ++i) {
        if (parent.children[i] instanceof type) {
            items.push(parent.children[i]);
            console.log("children[" + i + "]: ", parent.children[i], "was collected");
        }
    }

    return items;
}
