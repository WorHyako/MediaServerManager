#ifndef MEDIASERVERMANAGER_JSON_JSONQMLWRAPPER_HPP
#define MEDIASERVERMANAGER_JSON_JSONQMLWRAPPER_HPP

#include <QObject>
#include <QString>
#include <vector>
#include <array>

#include "json/ElementConfig.hpp"
#include "json/JsonManager.hpp"

namespace MediaServerManager::Json {

    enum class DynamicScopes {
        QuickButtons,
        ManagementButtons,
        QuickTitles,
    };

    /**
     *
     */
    class JsonQmlWrapper : public QObject {
    Q_OBJECT
    public:
        JsonQmlWrapper() = default;

        /**
         * Try to find file by path. Result will returned and saved to current file status.
         * Also file path will wrote to internal variable if successful.
         * @param filePath_ full or relative file path
         * @return          file status
         */
        [[nodiscard]] Q_INVOKABLE wor::Json::JsonManager::FileStatus TryToFindFile(const QString& filePath_) noexcept;

         /**
          * Try to save UI elements config to json file
          * @param items_
          * @return         saving result
          */
        [[nodiscard]] Q_INVOKABLE bool SaveConfigs(const QList<QObject*>& items_) noexcept;

        /**
         *
         */
        [[nodiscard]] Q_INVOKABLE bool LoadConfigs() noexcept;

    private:
        /**
         * Array declare scopes, which contain dynamic elements\n
         * Internal vector store elements info in current scope
         */
        using ConfigStorage = std::array<std::vector<MediaServerManager::ElementConfig>,
                static_cast<size_t>(std::numeric_limits<enum DynamicScopes>::max())>;

        ConfigStorage _elementsConfig;

        wor::Json::JsonManager _jsonManager;

        [[nodiscard]] std::string MakeConfig() const noexcept;

    public:
#pragma region Accessors

        /**
         * Return current file status via wor::Json::JsonManager::FileStatus
         * @return current file status
         */
        [[nodiscard]] Q_INVOKABLE wor::Json::JsonManager::FileStatus GetFileStatus() const noexcept;

        /**
         *
         * @return  current file name via path
         */
        [[nodiscard]] Q_INVOKABLE QString GetFileName() const noexcept;

#pragma endregion Accessors
    };
}

#endif
