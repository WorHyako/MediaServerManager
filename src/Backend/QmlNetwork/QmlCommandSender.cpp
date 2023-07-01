#include "QmlCommandSender.hpp"

using namespace MediaServerManager::Backend::Network;

QmlCommandSender::QmlCommandSender(QObject *parent) :
        QObject(parent),
        _commandText(""),
        _command(nullptr) {
}

bool QmlCommandSender::sendCommand() {
    return false;
}

#pragma region Accessors

QString QmlCommandSender::commandText() {
    return _commandText;
}

#pragma endregion Accessors

#pragma region Mutators

void QmlCommandSender::setCommandText(const QString &commandText) {
    if (_commandText == commandText) {
        return;
    }
    _commandText = commandText;
    emit commandTextChanged();
}

#pragma endregion Mutators
