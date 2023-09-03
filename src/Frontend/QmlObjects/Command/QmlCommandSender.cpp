#include "QmlCommandSender.hpp"

#include "Command/CommandBuilder.hpp"
#include "Network/SocketManager.hpp"

using namespace MediaServerManager::QmlObjects::Command;
using namespace MediaServerManager;

QmlCommandSender::QmlCommandSender(QObject *parent) :
        QObject(parent),
        _commandText(""),
        _command(nullptr) {
}

bool QmlCommandSender::makeCommand(QVariantList commandPairs) {
    MediaServerManager::Command::CommandItemList commandItemList;
    std::for_each(std::begin(commandPairs), std::end(commandPairs),
                  [&commandItemList](const QVariant &each) {
                      auto qStringList = each.value<QList<QString>>();
                      auto key = qStringList[0].toStdString();
                      auto value = qStringList[1].toStdString();
                      commandItemList.emplace_back(std::move(key), std::move(value));
                  });
    if (commandItemList.empty()) {
        return false;
    }
    auto command = MediaServerManager::Command::CommandBuilder<MediaServerManager::Command::ActionCommand>::BuildCommand(
            commandItemList);
    _command = std::make_unique<MediaServerManager::Command::ActionCommand>(command);
    auto s = _command->ToString();
    _commandText = std::string(std::begin(s), std::prev(std::end(s), 1)).c_str();

    emit commandTextChanged();
    return true;
}

bool QmlCommandSender::sendCommand() const noexcept {
    auto socketAdded = Network::SocketManager::Add(Wor::Network::EndPoint("127.0.0.1", 8000), 0);
    auto socket = Network::SocketManager::GetSocket(0);
    auto connectRes = socket->TryToConnect();
    if (!connectRes) {
        return false;
    }
    if (!_command) {
        return false;
    }
    auto ex1 = _command->Execute(socket);
    return true;
}

#pragma region Accessors

QString QmlCommandSender::commandText() {
    return _commandText;
}

#pragma endregion Accessors

#pragma region Mutators

void QmlCommandSender::setCommandText(QVariantList commandItems) {
    MediaServerManager::Command::CommandItemList commandItemList;
    std::for_each(std::begin(commandItems), std::end(commandItems),
                  [&commandItemList](const QVariant &each) {
                      auto qStringList = each.value<QList<QString>>();
                      auto key = qStringList[0].toStdString();
                      auto value = qStringList[1].toStdString();
                      commandItemList.emplace_back(std::move(key), std::move(value));
                  });
    if (commandItemList.empty()) {
        return;
    }
    auto command = MediaServerManager::Command::CommandBuilder<MediaServerManager::Command::ActionCommand>::BuildCommand(
            commandItemList);
    _command = std::make_unique<MediaServerManager::Command::ActionCommand>(command);
    auto s = _command->ToString();
    _commandText = std::string(std::begin(s), std::prev(std::end(s), 1)).c_str();

    emit commandTextChanged();
}

#pragma endregion Mutators
