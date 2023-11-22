#pragma once

#include <string>
#include <vector>
#include <atomic>
#include <unordered_map>
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
        [[nodiscard]] std::optional<std::string> get(const std::string &dataName) noexcept;

        /**
         * Add to LiveData storage data
         * @param dataName  LiveData value name
         * @param data      LivaData value
         */
        void set(const std::string &dataName, const std::string &data) noexcept;

        void setNotifyingFunc(std::function<void(const std::string &, const std::string &)> notifyingFunc) noexcept {
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
        std::unordered_map<std::string, std::string> _liveData;

        /**
         *
         */
        std::function<void(std::string, std::string)> _notifyingFunc;

        /**
         *
         */
        std::atomic<bool> _atomicFlag;
    };
}
