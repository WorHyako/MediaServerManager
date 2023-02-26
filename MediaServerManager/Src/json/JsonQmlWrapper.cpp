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
    switch (scope_) {
        case DynamicScopes::QuickButtons:
            configString = MakeQuickButtonsConfig(items);
            scopeName = "QuickButtonsScope";
            break;
        case DynamicScopes::ManagementButtons:
            configString = MakeManagementButtonConfig(items);
            scopeName = "ManagementButtonsScope";
            break;
        case DynamicScopes::QuickTitles:
            configString = MakeQuickTitlesConfig(items);
            scopeName = "QuickTitlesScope";
            break;
    }
    auto result = _jsonManager.TryToSaveFile(configString.dump(), scopeName);
    return result;
}

bool JsonQmlWrapper::LoadConfigs() noexcept {
    return false;
}

nlohmann::json JsonQmlWrapper::MakeQuickButtonsConfig(const std::vector<QObject*>& items_) const noexcept {
    const uint16_t itemNum = items_.size();

    nlohmann::json result;
    for (uint16_t i = 0; i < itemNum; ++i) {
        std::string buttonNumber("QuickButton");
        buttonNumber.append(std::to_string(i));
        result[buttonNumber]["text"] = items_[i]->property("text").toString().toStdString();
        result[buttonNumber]["name"] = items_[i]->property("name").toString().toStdString();
    }
    return result;
}

nlohmann::json JsonQmlWrapper::MakeQuickTitlesConfig(const std::vector<QObject*>& items_) const noexcept {
    const uint16_t itemNum = items_.size();

    nlohmann::json result;
    for (uint16_t i = 0; i < itemNum; ++i) {
        std::string buttonNumber("QuickTitle");
        buttonNumber.append(std::to_string(i));
        result[buttonNumber]["text"] = items_[i]->property("text").toString().toStdString();
    }
    return result;
}

nlohmann::json JsonQmlWrapper::MakeManagementButtonConfig(const std::vector<QObject*>& items_) const noexcept {
    return std::string();
}

#pragma region Accessors

wor::Json::JsonManager::FileStatus JsonQmlWrapper::GetFileStatus() const noexcept {
    return _jsonManager.GetFileStatus();
}

QString JsonQmlWrapper::GetFileName() const noexcept {
    return _jsonManager.GetFileName().c_str();
}

#pragma endregion Accessors
