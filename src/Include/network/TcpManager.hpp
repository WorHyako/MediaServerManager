#ifndef MEDIASERVERMANAGER_NETWORK_TCPMANAGER_HPP
#define MEDIASERVERMANAGER_NETWORK_TCPMANAGER_HPP

#include <QObject>
#include <QString>

#include "network/TcpSocket.hpp"

#include <memory>

namespace MediaServerManager::Network {
    /**
     *
     */
    class TcpManager final : public QObject {
    Q_OBJECT

    public:
        TcpManager() = default;

        Q_INVOKABLE void InitializeSocket() noexcept;

        [[nodiscard]] Q_INVOKABLE bool TryToConnect() noexcept;

    private:
        std::unique_ptr<wor::network::TcpSocket> tcpSocket;

    public:
#pragma region Accessors/Mutators

        [[nodiscard]] Q_INVOKABLE bool IsActive() const noexcept;

#pragma endregion Accessors / Mutators
    };
}
#endif
