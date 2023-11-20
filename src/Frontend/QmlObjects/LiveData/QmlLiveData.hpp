#pragma once

#include <QObject>
#include <qqml.h>
#include <QString>
#include <QList>
#include <QVariant>

#include <any>
#include <string>

namespace MediaServerManager::QmlObjects::LiveData {

    /**
     *
     */
    class QmlLiveData
            : public QObject {
    Q_OBJECT

        Q_PROPERTY(QString name READ getSqlFieldName WRITE setSqlFieldName NOTIFY nameChanged)
        Q_PROPERTY(QVariant value READ getSqlFieldValue WRITE setSqlFieldValue NOTIFY dataChanged)

        QML_ELEMENT
    public:
        /**
         * Ctor
         */
        explicit QmlLiveData(QObject *parent = nullptr) noexcept;

    private:
        /**
         * Sql field name to binding with control value
         */
        QString _sqlFieldName;

        /**
         *
         */
        QVariant _sqlFieldValue;

    public slots:

        void liveDataChanged(QString dataName, QVariant data);

    signals:

        void nameChanged(QString);

        void dataChanged(QVariant);
    public:
#pragma region Accessors

        /**
         * Accessor for `sqlFieldName`
         * @return sglFieldName
         */
        QString getSqlFieldName() noexcept;

        /**
         *
         * @return
         */
        QVariant getSqlFieldValue() noexcept;

#pragma endregion Accessors

#pragma region Mutators

        /**
         *
         * @param sqlFieldName
         */
        void setSqlFieldName(QString sqlFieldName) noexcept;

        /**
         *
         * @param sqlFieldValue
         */
        void setSqlFieldValue(QVariant sqlFieldValue) noexcept;

#pragma endregion Mutators
    };
}
