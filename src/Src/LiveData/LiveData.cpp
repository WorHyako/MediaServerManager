#include "LiveData/LiveData.hpp"

using namespace MediaServerManager::Livedata;

std::optional<std::string> LiveData::get(const std::string &dataName) noexcept {
    const auto found = isExist(dataName);
    return found
           ? std::optional<std::string>(_liveData.at(dataName))
           : std::nullopt;
}

void LiveData::set(const std::string &dataName, const std::string &data) noexcept {
    auto found = isExist(dataName);
    if (found) {
        _liveData.at(dataName) = data;
    } else {
        _liveData.emplace(std::pair<std::string, std::string> { dataName, data });
    }
    if (_notifyingFunc) {
        _notifyingFunc(dataName, data);
    }
}
