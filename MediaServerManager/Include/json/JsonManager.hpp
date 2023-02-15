#ifndef MEDIASERVERMANAGER_JSONMANAGER_HPP
#define MEDIASERVERMANAGER_JSONMANAGER_HPP

#include <fstream>
#include <iostream>

//#include "nlohmann/json.hpp"

namespace wor::Json {

    enum class FileStatus {
        ZeroCheck,
        Unreachable,
        Ready
    };

    class JsonManager final {
    public:
        JsonManager();

        FileStatus TryToFindFile(const std::string&& filePath_) noexcept;

        FileStatus fileStatus;

    private:
        [[nodiscard]] bool IsFileExist(const std::string& filePath_) const noexcept;

    public:
#pragma region Operators
#pragma endregion Operators

#pragma region Accessors
#pragma endregion Accessors

#pragma region Mutators
#pragma endregion Mutators
    };
}
#endif
