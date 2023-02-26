#include "json/JsonQmlWrapper.hpp"

#include <QVariant>
#include <QQuickItem>

using namespace MediaServerManager::Json;

wor::Json::JsonManager::FileStatus JsonQmlWrapper::TryToFindFile(const QString& filePath_, bool createFile_) noexcept {
    auto resultStatus = _jsonManager.TryToFindFile(std::move(filePath_.toStdString()), createFile_);
    return resultStatus;
}

bool JsonQmlWrapper::SaveConfigs(const QList<QObject*>& items_, DynamicScopes scope_) noexcept {
    std::vector<QObject*> items;
    items.reserve(items_.size());
    for (auto& eachQItem: items_) {
        if (!eachQItem || !qobject_cast<QQuickItem*>(eachQItem)) {
            continue;
        }
        items.push_back(eachQItem);
    }
    nlohmann::json configString;
    std::string scopeName;
    std::vector<std::string> propertiesList;
    switch (scope_) {
        case DynamicScopes::QuickButtons:
            propertiesList = {"text", "name"};
            configString = MakeQuickButtonsConfig(items, propertiesList);
            scopeName = "QuickButtonsScope";
            break;
        case DynamicScopes::ManagementButtons:
            propertiesList = {"text", "x", "y", "width", "height"};
            configString = MakeManagementButtonConfig(items, propertiesList);
            scopeName = "ManagementButtonsScope";
            break;
        case DynamicScopes::QuickTitles:
            propertiesList = {"text"};
            configString = MakeQuickTitlesConfig(items, propertiesList);
            scopeName = "QuickTitlesScope";
            break;
    }
    auto result = _jsonManager.TryToSaveFile(configString.dump(), scopeName);
    return result;
}

bool JsonQmlWrapper::LoadConfigs() noexcept {
    return false;
}

nlohmann::json JsonQmlWrapper::MakeQuickButtonsConfig(
        const std::vector<QObject*>& items_,
        const std::vector<std::string>& propertiesList_) const noexcept {
    const uint16_t itemNum = items_.size();

    nlohmann::json result;
    for (uint16_t i = 0; i < itemNum; ++i) {
        std::string buttonNumber("QuickButton_");
        buttonNumber.append(std::to_string(i));
        for (const auto& property: propertiesList_) {
            result[buttonNumber][property] = items_[i]->property(property.c_str()).toString().toStdString();
        }
    }
    return result;
}

nlohmann::json JsonQmlWrapper::MakeQuickTitlesConfig(
        const std::vector<QObject*>& items_,
        const std::vector<std::string>& propertiesList_) const noexcept {
    const uint16_t itemNum = items_.size();

    nlohmann::json result;
    for (uint16_t i = 0; i < itemNum; ++i) {
        std::string buttonNumber("QuickTitle_");
        buttonNumber.append(std::to_string(i));
        for (const auto& property: propertiesList_) {
            result[buttonNumber][property] = items_[i]->property(property.c_str()).toString().toStdString();
        }
    }
    return result;
}

nlohmann::json JsonQmlWrapper::MakeManagementButtonConfig(
        const std::vector<QObject*>& items_,
        const std::vector<std::string>& propertiesList_) const noexcept {
    const uint16_t itemNum = items_.size();

    nlohmann::json result;
    for (uint16_t i = 0; i < itemNum; ++i) {
        std::string buttonNumber("ManagementButton_");
        buttonNumber.append(std::to_string(i));
        for (const auto& property: propertiesList_) {
            result[buttonNumber][property] = items_[i]->property(property.c_str()).toString().toStdString();
        }
    }
    return result;
}

#pragma region Accessors

wor::Json::JsonManager::FileStatus JsonQmlWrapper::GetFileStatus() const noexcept {
    return _jsonManager.GetFileStatus();
}

QString JsonQmlWrapper::GetFileName() const noexcept {
    return _jsonManager.GetFileName().c_str();
}

#pragma endregion Accessors
