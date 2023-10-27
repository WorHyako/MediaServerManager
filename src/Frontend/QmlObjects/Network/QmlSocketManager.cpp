#include "QmlSocketManager.hpp"

#include <QHostAddress>
#include <QAbstractSocket>

using namespace MediaServerManager::QmlObjects::Network;

namespace {
    /**
     *
     */
    std::vector<std::pair<std::shared_ptr<Wor::Network::TcpSocket>, std::uint8_t>> socketList;
}

QmlSocketManager::QmlSocketManager(QObject *parent)
        : QObject(parent) {
}

std::shared_ptr<Wor::Network::TcpSocket> QmlSocketManager::GetSocket(std::uint8_t socketIndex) noexcept {
    for (const auto &each : socketList) {
        if (each.second == socketIndex) {
            return each.first;
        }
    }
    return nullptr;
}

bool QmlSocketManager::Add(Wor::Network::EndPoint endPoint, std::uint8_t socketIndex) noexcept {
    auto socket = std::make_shared<Wor::Network::TcpSocket>();
    socket->DestinationEndPoint(std::move(endPoint));
    /// TODO: Change to ping method
    if (!socket->TryToConnect()) {
        return false;
    }
//    socket->CloseConnection();
    ::socketList.emplace_back(socket, socketIndex);

    return true;
}

void QmlSocketManager::Remove(std::uint8_t socketIndex) noexcept {
    if (::socketList.size() - 1 < socketIndex) {
        return;
    }
    ::socketList.erase(std::next(std::begin(::socketList), socketIndex));
}

bool QmlSocketManager::add(QString address, int port, int socketIndex) noexcept {
    QHostAddress ipView(address);
    if (QAbstractSocket::IPv4Protocol == ipView.protocol()) {
        qDebug("Valid IPv4 address.");
    } else if (QAbstractSocket::IPv6Protocol == ipView.protocol()) {
        qDebug("Valid IPv6 address.");
    } else {
        qDebug("Unknown or invalid address.");
        return false;
    }
    return QmlSocketManager::Add(Wor::Network::EndPoint(address.toStdString(), port), socketIndex);
}

void QmlSocketManager::remove(std::uint8_t socketIndex) noexcept {
    Remove(socketIndex);
}
