#include "Json/JsonManager.hpp"

#include <sys/stat.h>

using namespace wor::Json;

JsonManager::JsonManager()
        : fileStatus(FileStatus::ZeroCheck) {
}

FileStatus JsonManager::TryToFindFile(const std::string&& filePath_) noexcept {
    if (!IsFileExist(filePath_)) {
        return FileStatus::Unreachable;
    }
    return FileStatus::Ready;
}

bool JsonManager::IsFileExist(const std::string& filePath_) const noexcept {
    struct stat buffer{};
    return (stat (filePath_.c_str(), &buffer) == 0);
}
