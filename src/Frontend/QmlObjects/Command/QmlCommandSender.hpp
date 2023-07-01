#ifndef MEDIASERVERMANAGER_QMLOBJECTS_COMMAND_QMLCOMMANDSENDER_HPP
#define MEDIASERVERMANAGER_QMLOBJECTS_COMMAND_QMLCOMMANDSENDER_HPP

#include <QObject>
#include <QString>
#include <QList>
#include <QPair>
#include <qqml.h>

#include <memory>
#include <vector>

#include "Command/ICommand.hpp"

namespace MediaServerManager::QmlObjects::Command {

    /**
     *
     */
    class QmlCommandSender : public QObject {
    Q_OBJECT

        Q_PROPERTY(QString commandText READ commandText NOTIFY commandTextChanged)
        QML_ELEMENT
    public:
        explicit QmlCommandSender(QObject *parent = nullptr);

        QString commandText();

        Q_INVOKABLE bool sendCommand();

        Q_INVOKABLE void setCommandText(QVariantList commandItems);

    signals:
        void commandTextChanged();

    private:
        QString _commandText;

        std::unique_ptr<MediaServerManager::Command::ICommand> _command;
    };
}

#endif
