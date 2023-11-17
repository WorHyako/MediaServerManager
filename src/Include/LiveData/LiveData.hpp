#pragma once

#include <string>
#include <vector>
#include <atomic>
#include <any>

#include "Utils/Sql/Events.hpp"

namespace Utils::Livedata {

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
         *
         * @param dataName
         * @return
         */
        template<class T>
        [[nodiscard]] std::optional<T> get(const std::string &dataName) noexcept;

        /**
         *
         * @param dataName
         * @param data
         */
        template<class T>
        void set(const std::string &dataName, const T &data) noexcept;

    private:
        /**
         *
         * @param dataName
         * @return
         */
        bool isExist(const std::string &dataName) const noexcept;

        /**
         *
         */
        std::unordered_map<std::string, std::any> _liveData;

        /**
         *
         */
        std::atomic<bool> _atomicFlag;
    };

    bool LiveData::isExist(const std::string &dataName) const noexcept {
        const auto found = std::find_if(std::begin(_liveData), std::end(_liveData),
                                        [&dataName](const auto &each) {
                                            return each.first == dataName;
                                        });
        return found != std::end(_liveData);
    }

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
    }
}
