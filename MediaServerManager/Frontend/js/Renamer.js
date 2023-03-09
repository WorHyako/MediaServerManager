/**
 * Function rename selected object's property and change this one's text
 * @param object        object that have property to rename
 * @param property      object's property to rename
 * @param newText       new text
 * @returns {boolean}   renaming success
 */
function rename(object, property, newText) {
    if (object[property] === undefined) {
        return false;
    }
    if (newText.length > 10) {
        return false;
    }
    object[property] = newText;
    return true;
}
