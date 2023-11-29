#include "Json/JsonQmlWrapper.hpp"

#include <QQuickItem>

using namespace MediaServerManager::Json;

Wor::Json::JsonManager::FileStatus JsonQmlWrapper::tryToFindFile(const QString &filePath_,
                                                                 bool createFile_) noexcept {
    const auto resultStatus = _jsonManager.tryToFindFile(std::move(filePath_.toStdString()), createFile_);
    return resultStatus;
}

bool JsonQmlWrapper::saveConfigs(const QList<QObject *> &items_,
                                 DynamicScopeType scope_) noexcept {
    std::vector<QObject *> items;
    for (auto &eachQItem : items_) {
        if (!eachQItem || !qobject_cast<QQuickItem *>(eachQItem)) {
            continue;
        }
        items.emplace_back(eachQItem);
    }
    nlohmann::json configString;
    std::string scopeName;
    std::vector<std::string> propertiesList;
    switch (scope_) {
        case DynamicScopeType::QuickButtons:
            propertiesList = { "text", "name" };
            configString = makeQuickButtonsConfig(items, propertiesList);
            scopeName = "QuickButtonsScope";
            break;
        case DynamicScopeType::ManagementButtons:
            propertiesList = { "x", "y", "width", "height", "sqlDataNameDisplaying", "sqlDataName", "objectName" };
            configString = makeManagementScopeConfig(items, propertiesList);
            scopeName = "ManagementButtonsScope";
            break;
        case DynamicScopeType::QuickTitles:
            propertiesList = { "text" };
            configString = makeQuickTitlesConfig(items, propertiesList);
            scopeName = "QuickTitlesScope";
            break;
        default:
            break;
    }
    const auto result = _jsonManager.tryToSaveFile(configString.dump(), scopeName);
    return result;
}

QString JsonQmlWrapper::loadConfigs(DynamicScopeType scope_) noexcept {
    std::string scopeName {};
    switch (scope_) {
        case DynamicScopeType::QuickButtons:
            scopeName = "QuickButtonsScope";
            break;
        case DynamicScopeType::ManagementButtons:
            scopeName = "ManagementButtonsScope";
            break;
        case DynamicScopeType::QuickTitles:
            scopeName = "QuickTitlesScope";
            break;
        case DynamicScopeType::All:
            break;
    }
    std::string configString = "null";
    const nlohmann::json jsonContent = _jsonManager.tryToLoadFile(scopeName);
    if (jsonContent.is_object()) {
        configString = jsonContent.dump();
    }
    return { configString.c_str() };
}

nlohmann::json JsonQmlWrapper::makeQuickButtonsConfig(
        const std::vector<QObject *> &items_,
        const std::vector<std::string> &propertiesList_) const noexcept {
    const std::uint16_t itemNum = items_.size();

    nlohmann::json result;
    for (std::size_t i = 0; i < itemNum; ++i) {
        std::string buttonNumber("QuickButton_");
        buttonNumber.append(std::to_string(i));
        for (const auto &property : propertiesList_) {
            result[buttonNumber][property] =
                    items_[i]->property(property.c_str()).toString().toStdString();
        }
    }
    return result;
}

nlohmann::json JsonQmlWrapper::makeQuickTitlesConfig(
        const std::vector<QObject *> &items_,
        const std::vector<std::string> &propertiesList_) const noexcept {
    const std::uint16_t itemNum = items_.size();

    nlohmann::json result;
    for (std::size_t i = 0; i < itemNum; ++i) {
        std::string buttonNumber("QuickTitle_");
        buttonNumber.append(std::to_string(i));
        for (const auto &property : propertiesList_) {
            result[buttonNumber][property] =
                    items_[i]->property(property.c_str()).toString().toStdString();
        }
    }
    return result;
}

nlohmann::json JsonQmlWrapper::makeManagementScopeConfig(const std::vector<QObject *> &items,
                                                         const std::vector<std::string> &propertiesList) const noexcept {
    const std::uint32_t itemNum = items.size();
    nlohmann::json result;

    for (std::size_t i = 0; i < itemNum; ++i) {
        const auto objectName = items[i]->property("objectName").toString();
        const std::string objectUniqName(objectName.toStdString() + "_" + std::to_string(i));
        for (const auto &property : propertiesList) {
            result[objectUniqName][property] = items[i]->property(property.c_str()).toString().toStdString();
        }
    }
    return result;
}

#pragma region Accessors

Wor::Json::JsonManager::FileStatus
JsonQmlWrapper::getFileStatus() const noexcept {
    return _jsonManager.getFileStatus();
}

QString JsonQmlWrapper::getFileName() const noexcept {
    return _jsonManager.getFileName().c_str();
}

#pragma endregion Accessors
