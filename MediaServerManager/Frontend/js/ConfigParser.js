/**
 *
 * @param configString
 * @param configType
 * @returns {*[]|null}
 */
function parseConfig(configString, configType) {
    let jsonObject;
    try {
        jsonObject = JSON.parse(configString);
    } catch (e) {
        console.log("Json parse exception");
        return null;
    }

    let resultArray = [];
    console.log("-----", DynamicScopeType.QuickButtons)
    const elementNodeNamePattern = "QuickButton_";
    for (let i = 0; ; ++i) {
        const elementNodeName = elementNodeNamePattern + i;
        if (jsonObject[elementNodeName] === undefined) {
            break;
        }
        console.log("Parsed config:");
        console.log("Node name", elementNodeName);
        for (const key in jsonObject[elementNodeName]) {
            const value = jsonObject[elementNodeName][key]
            console.log("Key:", key, ". Value:", value)
            resultArray.push([String(key), String(value)])
        }
    }
    return resultArray;
}

/**
 *
 * @param configArray
 * @returns {boolean}   UI loading result
 */
function loadUiFromConfig(configArray) {
    return false;
}
