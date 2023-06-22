#include "network/TcpManager.hpp"

using namespace MediaServerManager::Network;

bool TcpManager::TryToConnect() noexcept {
    if (!tcpSocket) {
        return false;
    }
    return tcpSocket->TryToConnect();
}

void TcpManager::InitializeSocket() noexcept {}

#pragma region Accessors/Mutators

bool TcpManager::IsActive() const noexcept {
    tcpSocket;
    return false;
}

#pragma region Accessors/Mutators
