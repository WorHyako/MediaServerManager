#pragma once

#include <QObject>
#include <QString>

#include "WorLibrary/Network/TcpSocket.hpp"

namespace MediaServerManager::QmlObjects::Network {

    /**
     *
     */
    class QmlSocketManager : public QObject {
    Q_OBJECT

    public:
        using WorTcpSocket = Wor::Network::TcpSocket;

        /**
         *
         * @param endPoint
         * @param socketIndex
         * @return
         */
        [[nodiscard]] static bool Add(Wor::Network::EndPoint endPoint, uint8_t socketIndex) noexcept;

        /**
         *
         * @param socketIndex
         */
        static void Remove(uint8_t socketIndex) noexcept;

        /**
         *
         * @param socketIndex
         * @return
         */
        [[nodiscard]] static std::shared_ptr<WorTcpSocket> GetSocket(uint8_t socketIndex) noexcept;

    signals:

    private:
        /**
         *
         */
         std::unique_ptr<WorTcpSocket> _socketManager;

    public:
#pragma region Accessors

#pragma endregion Accessors

#pragma region Mutators

#pragma endregion Mutators
    };
}
