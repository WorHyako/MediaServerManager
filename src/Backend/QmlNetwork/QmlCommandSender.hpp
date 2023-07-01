#ifndef MEDIASERVERMANAGER_BACKEND_NETWORK_QMLCOMMANDSENDER_HPP
#define MEDIASERVERMANAGER_BACKEND_NETWORK_QMLCOMMANDSENDER_HPP

#include <QObject>
#include <QString>
#include <qqml.h>

#include <memory>

#include "Command/ICommand.hpp"

namespace MediaServerManager::Backend::Network {

    /**
     *
     */
    class QmlCommandSender : public QObject {
    Q_OBJECT

        Q_PROPERTY(QString commandText READ commandText WRITE setCommandText NOTIFY commandTextChanged)
        QML_ELEMENT
    public:
        explicit QmlCommandSender(QObject *parent = nullptr);

        QString commandText();

        Q_INVOKABLE bool sendCommand();

        void setCommandText(const QString &commandText);

    signals:
        void commandTextChanged();

    private:
        QString _commandText;

        std::unique_ptr<Command::ICommand> _command;
    };
}

#endif
