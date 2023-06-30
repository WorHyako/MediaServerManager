#include "Network/SocketManager.hpp"

using namespace MediaServerManager::Network;

namespace {
    std::vector<std::pair<std::shared_ptr<SocketManager::WorTcpSocket>, uint8_t>> socketList;
}

std::shared_ptr<SocketManager::WorTcpSocket> SocketManager::GetSocket(uint8_t socketIndex) noexcept {
    for(const auto & each : socketList){
        if(each.second == socketIndex){
            return each.first;
        }
    }
    return nullptr;
}

bool SocketManager::Add(Wor::Network::EndPoint endPoint, uint8_t socketIndex) noexcept {
    auto socket = std::make_shared<WorTcpSocket>();
    socket->DestinationEndPoint(std::move(endPoint));
    if (!socket->TryToConnect()) {
        return false;
    }
    socket->CloseConnection();
    ::socketList.emplace_back(socket, socketIndex);
    return true;
}

void SocketManager::Remove(uint8_t socketIndex) noexcept {
    if (::socketList.size() - 1 < socketIndex) {
        return;
    }
    ::socketList.erase(std::next(std::begin(::socketList), socketIndex));
}
