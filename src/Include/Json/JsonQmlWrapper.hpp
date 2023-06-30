#ifndef MEDIASERVERMANAGER_JSON_JSONQMLWRAPPER_HPP
#define MEDIASERVERMANAGER_JSON_JSONQMLWRAPPER_HPP

#include <QObject>
#include <QString>
#include <vector>
#include <array>

#include "Json/ElementConfig.hpp"
#include "Json/JsonManager.hpp"
#include "DynamicScopeType.hpp"

namespace MediaServerManager::Json {
    /**
     *
     */
    class JsonQmlWrapper : public QObject {
    Q_OBJECT

    public:
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
        TryToFindFile(const QString &filePath_,
                      bool createFile = true) noexcept;

        /**
         * Try to save UI elements config to json file
         * @param items_
         * @param scope_
         * @return          saving result
         */
        [[nodiscard]] Q_INVOKABLE bool
        SaveConfigs(const QList<QObject *> &items_,
                    DynamicScopeType scope_) noexcept;

        /**
         * Try to load UI elements config from json file
         * @param scope_
         * @return          loading result
         */
        [[nodiscard]] Q_INVOKABLE QString
        LoadConfigs(DynamicScopeType scope_) noexcept;

    private:
        /**
         * Array declare scopes, which contain dynamic elements\n
         * Internal vector store elements info in current scope
         */
        using ConfigStorage =
                std::array<std::vector<MediaServerManager::ElementConfig>,
                        static_cast<size_t>(
                                std::numeric_limits<DynamicScopeType>::max())>;

        ConfigStorage _elementsConfig;

        Wor::Json::JsonManager _jsonManager;

        [[nodiscard]] nlohmann::json MakeQuickButtonsConfig(
                const std::vector<QObject *> &items_,
                const std::vector<std::string> &propertiesList_) const noexcept;

        [[nodiscard]] nlohmann::json MakeQuickTitlesConfig(
                const std::vector<QObject *> &items_,
                const std::vector<std::string> &propertiesList_) const noexcept;

        [[nodiscard]] nlohmann::json MakeManagementButtonConfig(
                const std::vector<QObject *> &items_,
                const std::vector<std::string> &propertiesList_) const noexcept;

    public:
#pragma region Accessors

        /**
         * Return current file status via wor::Json::JsonManager::FileStatus
         * @return current file status
         */
        [[nodiscard]] Q_INVOKABLE Wor::Json::JsonManager::FileStatus
        GetFileStatus() const noexcept;

        /**
         *
         * @return  current file name via path
         */
        [[nodiscard]] Q_INVOKABLE QString GetFileName() const noexcept;

#pragma endregion Accessors
    };
}
#endif
