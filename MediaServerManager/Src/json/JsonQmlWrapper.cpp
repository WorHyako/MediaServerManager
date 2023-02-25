#include <QVariant>
#include <QQuickItem>
#include "json/JsonQmlWrapper.hpp"

using namespace MediaServerManager::Json;

wor::Json::JsonManager::FileStatus JsonQmlWrapper::TryToFindFile(const QString& filePath_) noexcept {
    auto resultStatus = _jsonManager.TryToFindFile(std::move(filePath_.toStdString()));
    return resultStatus;
}

bool JsonQmlWrapper::SaveConfigs(const QList<QObject*>& items_) noexcept {
    for (auto& each: items_) {
        if (!each) {
            continue;
        }
        QQuickItem* my_quick_ptr = qobject_cast<QQuickItem*>(each);
        if (my_quick_ptr) {
            const auto textQProperty = my_quick_ptr->property("text").toString();
            const std::string textProperty(textQProperty.toStdString());
        }
    }
    auto configString = MakeConfig();
    auto result = _jsonManager.TryToSaveFile(configString);
    return result;
}

bool JsonQmlWrapper::LoadConfigs() noexcept {
    return false;
}

std::string JsonQmlWrapper::MakeConfig() const noexcept {
    std::string result = "";
    return result;
}

#pragma region Accessors

wor::Json::JsonManager::FileStatus JsonQmlWrapper::GetFileStatus() const noexcept {
    return _jsonManager.fileStatus;
}

QString JsonQmlWrapper::GetFileName() const noexcept {
    return _jsonManager.GetFileName().c_str();
}

#pragma endregion Accessors
