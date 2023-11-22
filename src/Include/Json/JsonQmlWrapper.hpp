#pragma once

#include <QObject>
#include <QString>
#include <vector>
#include <array>

#include "Json/ElementConfig.hpp"
#include "DynamicScopeType.hpp"

#include "WorLibrary/Json/JsonManager.hpp"

namespace MediaServerManager::Json {

    /**
     *
     */
    class JsonQmlWrapper
            : public QObject {
    Q_OBJECT

    public:
        /*
         * Ctor.
         */
        JsonQmlWrapper() = default;

        using DynamicScopeType = MediaServerManager::DynamicScopeType::Value;

        /**
         * Try to find file by path. Result will returned and saved to current
         * file status\n Also file path will wrote to internal variable if
         * successful
         * @param filePath_ full or relative file path
         * @return          file status
         */
        [[nodiscard]] Q_INVOKABLE Wor::Json::JsonManager::FileStatus
        tryToFindFile(const QString &filePath_,
                      bool createFile = true) noexcept;

        /**
         * Try to save UI elements config to json file
         * @param items_
         * @param scope_
         * @return          saving result
         */
        [[nodiscard]] Q_INVOKABLE bool saveConfigs(const QList<QObject *> &items_,
                                                   DynamicScopeType scope_) noexcept;

        /**
         * Try to load UI elements config from json file
         * @param scope_
         * @return          loading result
         */
        [[nodiscard]] Q_INVOKABLE QString loadConfigs(DynamicScopeType scope_) noexcept;

    private:
        /**
         * Array declare scopes, which contain dynamic elements\n
         * Internal vector store elements info in current scope
         */
        using ConfigStorage =
                std::array<std::vector<MediaServerManager::ElementConfig>,
                        static_cast<std::size_t>(
                                std::numeric_limits<DynamicScopeType>::max())>;

        /**
         *
         */
        ConfigStorage _elementsConfig;

        /**
         *
         */
        Wor::Json::JsonManager _jsonManager;

        /**
         *
         * @param items_
         * @param propertiesList_
         * @return
         */
        [[nodiscard]] nlohmann::json makeQuickButtonsConfig(
                const std::vector<QObject *> &items_,
                const std::vector<std::string> &propertiesList_) const noexcept;

        /**
         *
         * @param items_
         * @param propertiesList_
         * @return
         */
        [[nodiscard]] nlohmann::json makeQuickTitlesConfig(
                const std::vector<QObject *> &items_,
                const std::vector<std::string> &propertiesList_) const noexcept;

        /**
         *
         * @param items_
         * @param propertiesList_
         * @return
         */
        [[nodiscard]] nlohmann::json makeManagementButtonConfig(
                const std::vector<QObject *> &items_,
                const std::vector<std::string> &propertiesList_) const noexcept;

    public:
#pragma region Accessors

        /**
         * Return current file status via wor::Json::JsonManager::FileStatus
         * @return current file status
         */
        [[nodiscard]] Q_INVOKABLE Wor::Json::JsonManager::FileStatus
        getFileStatus() const noexcept;

        /**
         *
         * @return  current file name via path
         */
        [[nodiscard]] Q_INVOKABLE QString getFileName() const noexcept;

#pragma endregion Accessors
    };
}
