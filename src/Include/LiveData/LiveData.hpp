#pragma once

#include <string>
#include <vector>
#include <atomic>
#include <any>
#include <functional>

#include "Utils/Sql/Events.hpp"

namespace MediaServerManager::Livedata {

    /**
     *
     */
    class LiveData {
    public:
        /**
         * Dtor
         */
        virtual ~LiveData() = default;

        /**
         * Get data from LivaData storage
         * @param dataName  LiveData value name
         * @return          LiveData value
         */
        template<class T>
        [[nodiscard]] std::optional<T> get(const std::string &dataName) noexcept;

        /**
         * Add to LiveData storage data
         * @param dataName  LiveData value name
         * @param data      LivaData value
         */
        template<class T>
        void set(const std::string &dataName, const T &data) noexcept;

        void setNotifyingFunc(std::function<void(const std::string &, const std::any &)> notifyingFunc) noexcept {
            _notifyingFunc = std::move(notifyingFunc);
        }

    private:
        /**
         * Is current data exist in storage already
         * @param dataName  LiveData value name
         * @return
         */
        [[nodiscard]] bool isExist(const std::string &dataName) const noexcept {
            const auto found = std::find_if(std::begin(_liveData), std::end(_liveData),
                                            [&dataName](const auto &each) {
                                                return each.first == dataName;
                                            });
            return found != std::end(_liveData);
        }

        /**
         *  LiveData storage
         */
        std::unordered_map<std::string, std::any> _liveData;

        /**
         *
         */
        std::function<void(std::string, std::any)> _notifyingFunc;

        /**
         *
         */
        std::atomic<bool> _atomicFlag;
    };

    template<class T>
    std::optional<T> LiveData::get(const std::string &dataName) noexcept {
        const auto found = isExist(dataName);
        return found
               ? std::optional<T>(std::any_cast<T>(_liveData.at(dataName)))
               : std::nullopt;
    }

    template<class T>
    void LiveData::set(const std::string &dataName, const T &data) noexcept {
        auto found = isExist(dataName);
        if (found) {
            _liveData.at(dataName) = data;
        } else {
            _liveData.emplace(std::pair<std::string, std::any> { dataName, data });
        }
        if (_notifyingFunc) {
            _notifyingFunc(dataName, data);
        }
    }
}
