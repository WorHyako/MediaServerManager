#pragma once

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
        /**
         * Ctor
         * @param parent
         */
        explicit QmlCommandSender(QObject *parent = nullptr);

        /**
         *
         * @return
         */
        QString commandText();

        /**
         *
         * @return
         */
        Q_INVOKABLE [[nodiscard]] bool sendCommand() const noexcept;

        /**
         *
         * @param commandItems
         */
        Q_INVOKABLE void setCommandText(QVariantList commandItems);

        /**
         *
         * @param commandPairs
         * @return
         */
        Q_INVOKABLE bool makeCommand(QVariantList commandPairs);

    signals:

        /**
         *
         */
        void commandTextChanged();

    private:
        /**
         *
         */
        QString _commandText;

        /**
         *
         */
        std::unique_ptr<MediaServerManager::Command::ICommand> _command;
    };
}
