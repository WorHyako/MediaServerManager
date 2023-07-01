#include "QmlCommandSender.hpp"

#include "Command/CommandBuilder.hpp"

#include "Network/SocketManager.hpp"

using namespace MediaServerManager::Backend::Network;

QmlCommandSender::QmlCommandSender(QObject *parent) :
        QObject(parent),
        _commandText(""),
        _command(nullptr) {
}

bool QmlCommandSender::sendCommand() {
    auto socketAdded = MediaServerManager::Network::SocketManager::Add(Wor::Network::EndPoint("127.0.0.1", 8000), 0);
    auto socket = MediaServerManager::Network::SocketManager::GetSocket(0);
    std::ignore = socket->TryToConnect();
    auto ex1 = _command->Execute(socket);
    return false;
}

#pragma region Accessors

QString QmlCommandSender::commandText() {
    return _commandText;
}

#pragma endregion Accessors

#pragma region Mutators

void QmlCommandSender::setCommandText(QVariantList commandItems) {
    Command::CommandItemList commandItemList;
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
    auto command = Command::CommandBuilder<Command::ActionCommand>::BuildCommand(commandItemList);
    _command = std::make_unique<Command::ActionCommand>(command);
    auto s = _command->ToString();
    _commandText = std::string(std::begin(s), std::prev(std::end(s), 1)).c_str();

    emit commandTextChanged();
}

#pragma endregion Mutators
