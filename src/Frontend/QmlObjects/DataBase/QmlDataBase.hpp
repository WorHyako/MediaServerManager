#ifndef MEDIASERVERMANAGER_QMLOBJECTS_DATABASE_QMLDATABASE_HPP
#define MEDIASERVERMANAGER_QMLOBJECTS_DATABASE_QMLDATABASE_HPP

#include <QObject>
#include <QString>
#include <qqml.h>

namespace MediaServerManager::QmlObjects::DataBase {

    /**
     *
     */
    class QmlDataBase : public QObject {
    Q_OBJECT

        QML_ELEMENT
    public:
        explicit QmlDataBase(QObject *parent = nullptr) noexcept;

        Q_INVOKABLE QString requestData(const QString& requestString) noexcept;

    public:
#pragma region Accessors

#pragma endregion Accessors

#pragma region Mutators

#pragma endregion Mutators
    };
}

#endif
