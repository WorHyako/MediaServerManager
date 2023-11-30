#pragma once

#include <QObject>
#include <QString>

#include <string>
#include <any>

namespace MediaServerManager::LiveData {

    /**
     *
     */
    class QmlLiveDataTracker
            : public QObject {
    Q_OBJECT

    public:
        /**
         * Ctor
         */
        QmlLiveDataTracker() = default;

        void notifyAll(const std::string &dataName, const std::string &data) noexcept;

    public:
#pragma region Slots/Signals

    signals:

        void liveDataChanged(QString dataName, QString data);

#pragma endregion Slots/Signals
    };
}
