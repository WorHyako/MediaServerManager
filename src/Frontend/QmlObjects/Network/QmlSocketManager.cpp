#include "QmlSocketManager.hpp"

using namespace MediaServerManager::QmlObjects::Network;

namespace {
    /**
     *
     */
    std::vector<std::pair<std::shared_ptr<QmlSocketManager::WorTcpSocket>, uint8_t>> socketList;
}

std::shared_ptr<QmlSocketManager::WorTcpSocket> QmlSocketManager::GetSocket(uint8_t socketIndex) noexcept {
    for (const auto &each : socketList) {
        if (each.second == socketIndex) {
            return each.first;
        }
    }
    return nullptr;
}

bool QmlSocketManager::Add(Wor::Network::EndPoint endPoint, uint8_t socketIndex) noexcept {
    auto socket = std::make_shared<WorTcpSocket>();
    socket->DestinationEndPoint(std::move(endPoint));
    /// TODO: Change to ping method
    if (!socket->TryToConnect()) {
        return false;
    }
    socket->CloseConnection();
    ::socketList.emplace_back(socket, socketIndex);
    return true;
}

void QmlSocketManager::Remove(uint8_t socketIndex) noexcept {
    if (::socketList.size() - 1 < socketIndex) {
        return;
    }
    ::socketList.erase(std::next(std::begin(::socketList), socketIndex));
}
