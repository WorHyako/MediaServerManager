#pragma once

#include <QObject>
#include <qqml.h>

namespace MediaServerManager::QmlObjects::LiveData {

    /**
     *
     */
    class QmlLiveData
            : public QObject {
    Q_OBJECT

        Q_PROPERTY(QString dataName READ getDataName WRITE setDataName NOTIFY dataNameChanged)
        Q_PROPERTY(QString data READ getData WRITE setData NOTIFY dataChanged)

        QML_ELEMENT

    public:
        /**
         * Ctor
         */
        explicit QmlLiveData(QObject *parent = nullptr) noexcept;

        /**
         *
         */
         Q_INVOKABLE void updateData() noexcept;

    private:
        /**
         * Sql field name to binding with control value
         */
        QString _dataName;

        /**
         *
         */
        QString _data;

    public slots:

        void liveDataChanged(QString dataName, QString data);

    signals:

        void dataNameChanged(QString);

        void dataChanged(QString);

    public:
#pragma region Accessors

        /**
         * Accessor for `sqlFieldName`
         * @return sglFieldName
         */
        QString getDataName() noexcept;

        /**
         *
         * @return
         */
        QString getData() noexcept;

#pragma endregion Accessors

#pragma region Mutators

        /**
         *
         * @param sqlFieldName
         */
        void setDataName(QString dataName) noexcept;

        /**
         *
         * @param sqlFieldValue
         */
        void setData(QString data) noexcept;

#pragma endregion Mutators
    };
}
