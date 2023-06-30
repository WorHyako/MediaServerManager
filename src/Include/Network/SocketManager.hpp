#ifndef MEDIASERVERMANAGER_NETWORK_SOCKETMANAGER_HPP
#define MEDIASERVERMANAGER_NETWORK_SOCKETMANAGER_HPP

#include "Network/TcpSocket.hpp"

#include <memory>
#include <vector>

namespace MediaServerManager::Network {

    /**
     *
     */
    class SocketManager {
    public:
        using WorTcpSocket = Wor::Network::TcpSocket;

        /**
         *
         * @param socket
         * @param socketIndex
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
    };
}

#endif
