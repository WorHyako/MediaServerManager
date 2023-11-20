#pragma once

#include <QObject>
#include <QString>
#include <QVariant>

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
         * @param parent
         */
        QmlLiveDataTracker() = default;

        void notifyAll(const std::string &dataName, const std::any &data) noexcept;

    public:
#pragma region Slots/Signals

    signals:

        void liveDataChanged(QString dataName, QVariant data);

#pragma endregion Slots/Signals
    };
}
