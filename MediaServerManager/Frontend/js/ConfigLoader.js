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

    const elementNodeNamePattern = getScopeNamePattern(configType);

    let resultArray = [];
    for (let i = 0; ; ++i) {
        let elementConfig = [];
        const elementNodeName = elementNodeNamePattern + i;
        if (jsonObject[elementNodeName] === undefined) {
            break;
        }
        for (const key in jsonObject[elementNodeName]) {
            const value = jsonObject[elementNodeName][key];
            elementConfig.push([String(key), String(value)]);
        }
        resultArray.push(elementConfig)
    }
    return resultArray;
}

/**
 *
 * @param configString
 * @param configType
 * @returns {boolean}   UI loading result
 */
function loadUiFromConfig(configString, configType, scopeObject) {
    const configArray = parseConfig(configString, configType);
    const elementPath = getElementPath(configType);
    for (const config in configArray) {
        ItemCreator.createNewItem(elementPath, scopeObject);
    }
    return false;
}

/**
 * Return scope name pattern of selected Dynamic scope type
 * @param scopeType     Scope type via MediaServerManager.DynamicScopeType
 * @returns {string}    Result pattern via string
 */
function getScopeNamePattern(scopeType) {
    let namePattern;
    switch (scopeType) {
        case MSM.DynamicScopeType.QuickButtons:
            namePattern = "QuickButton_";
            break;
        case MSM.DynamicScopeType.QuickTitles:
            namePattern = "QuickTitle_";
            break;
        case MSM.DynamicScopeType.ManagementButtons:
            namePattern = "ManagementButton_";
            break;
        case MSM.DynamicScopeType.All:
            break;
        default:
    }
    return namePattern;
}

/**
 *
 * @param scopeType
 * @returns {string}
 */
function getElementPath(scopeType) {
    let elementPath;
    switch (scopeType) {
        case MSM.DynamicScopeType.QuickButtons:
        case MSM.DynamicScopeType.ManagementButtons:
            elementPath = "qrc:/Controls/ManagementButton.qml";
            break;
        case MSM.DynamicScopeType.QuickTitles:
            elementPath = "qrc:/Controls/QuickTitleLine.qml";
            break;
        case MSM.DynamicScopeType.All:
            break;
        default:
    }
    return elementPath;
}