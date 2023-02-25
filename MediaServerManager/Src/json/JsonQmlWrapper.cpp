#include "json/JsonQmlWrapper.hpp"

using namespace MediaServerManager::Json;

wor::Json::JsonManager::FileStatus JsonQmlWrapper::TryToFindFile(const QString& filePath_) noexcept {
    auto resultStatus = _jsonManager.TryToFindFile(std::move(filePath_.toStdString()));
    return resultStatus;
}

bool JsonQmlWrapper::SaveConfigs() noexcept {
    return false;
}

bool JsonQmlWrapper::LoadConfigs() noexcept {
    return false;
}

#pragma region Accessors

wor::Json::JsonManager::FileStatus JsonQmlWrapper::GetFileStatus() const noexcept {
    return _jsonManager.fileStatus;
}

QString JsonQmlWrapper::GetFileName() const noexcept {
    return _jsonManager.GetFileName().c_str();
}

#pragma endregion Accessors
