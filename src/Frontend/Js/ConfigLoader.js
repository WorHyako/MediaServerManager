.import "ObjectsQrcPath.js" as ObjectsQrc
.import "QrcItemCreator.js" as QrcItemCreator
.import "ItemCreator.js" as WorItemCreator
.import MediaServerManager 1.0 as MSM;

const managementButtonSettings = {
    "canBeMoved": true,
    "canBeResized": true
};

/**
 * Try to parse string from configuration file via json string
 * @param configString  Configuration json string
 * @param configType    Type of dynamic object whose config we want
 * @returns {*[]|null}  null - parsing error
 */
function parseConfig(configString, configType) {
    let jsonObject;
    try {
        jsonObject = JSON.parse(configString);
    } catch (e) {
        console.log(`Json parse exception`);
        return null;
    }

    const elementNodeNamePattern = getScopeNamePattern(configType)[0];

    let resultArray = [];
    for (const x in jsonObject) {
        let elementConfig = [];
        for (const key in jsonObject[x]) {
            const value = jsonObject[x][key];
            elementConfig.push([String(key), String(value)]);
        }
        resultArray.push(elementConfig);
    }

    return resultArray;
}

/**
 * Load UI elements state from config file
 * All current root object's child will be deleted and replaced elements from config
 * @param configString  Configuration string from configuration json file
 * @param configType    Type of dynamic object
 * @param scopeObject   UI element that contain dynamic controls
 * @returns {boolean}   UI loading result
 */
function loadUiFromConfig(configString, configType, scopeObject) {
    const configArray = parseConfig(configString, configType);
    console.log(`configArray: ${configArray}`);

    clearAllObjectChild(scopeObject);
    const defaultPreset = getDefaultControlPresets(configType, scopeObject);

    for (let configCount = 0; configCount < configArray.length; ++configCount) {
        const configObject = arrayToObject(configArray[configCount]);
        Object.assign(configObject, defaultPreset);
        console.log(`\n\nobject to str: ${Object.entries(configObject)}`);
        let object = WorItemCreator.createItem(
            `WorManagementControls`,
            configObject.objectName,
            ``,
            scopeObject,
            configObject.objectName
        );
        for (const [key, value] of Object.entries(configObject)) {
            object[key] = value;
        }
    }
    return true;
}

/**
 *
 * @param arr
 * @returns {{}}
 */
function arrayToObject(arr) {
    let s = {};
    const key = 0;
    const value = 1;
    for (let i = 0; i < arr.length; ++i) {
        s[arr[i][key]] = arr[i][value];
    }
    return s;
}

/**
 * Get default preset for selected control type
 * @param controlType   Dynamic control type via MSM.DynamicScopeType
 * @param movableScope  UI object, which has movable scope role
 * @returns {{}}        Result preset object
 */
function getDefaultControlPresets(controlType, movableScope) {
    let presets = {};
    switch (controlType) {
        case MSM.DynamicScopeType.QuickButtons:
            break;
        case MSM.DynamicScopeType.QuickTitles:
            break;
        case MSM.DynamicScopeType.ManagementButtons:
            presets = managementButtonSettings;
            presets.movableScope = movableScope;
            break;
        case MSM.DynamicScopeType.All:
        default:
            break;
    }
    return presets
}

/**
 * Return scope name pattern of selected Dynamic scope type
 * @param scopeType Scope type via MSM.DynamicScopeType
 * @returns {*[]}   Result pattern via string
 */
function getScopeNamePattern(scopeType) {
    let namePattern = [];
    switch (scopeType) {
        case MSM.DynamicScopeType.QuickButtons:
            namePattern.push(`QuickButton_`);
            break;
        case MSM.DynamicScopeType.QuickTitles:
            namePattern.push(`QuickTitle_`);
            break;
        case MSM.DynamicScopeType.ManagementButtons:
            namePattern.push(`ManagementButtonWithText_`);
            break;
        case MSM.DynamicScopeType.All:
            namePattern.push(
                `QuickButton_`,
                `QuickTitle_`,
                `ManagementButtonWithText_`);
            break;
        default:
    }
    return namePattern;
}

/**
 * Clear all child elements from selected object
 * @param rootObject    Parent object
 */
function clearAllObjectChild(rootObject) {
    for (let i = rootObject.children.length; i > 0; i--) {
        rootObject.children[i - 1].destroy();
    }
}
