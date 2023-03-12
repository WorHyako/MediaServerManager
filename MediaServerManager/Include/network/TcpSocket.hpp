#ifndef MEDIASERVERMANAGER_NETWORK_TCPSOCKET_HPP
#define MEDIASERVERMANAGER_NETWORK_TCPSOCKET_HPP

#include <boost/asio.hpp>

#include <string>
#include <vector>
#include <memory>

#include "network/EndPoint.hpp"
#include "network/ISocket.hpp"

namespace wor::network {

    /// TODO: Replace to worLibrary
    /**
     *
     */
    class TcpSocket : public ISocket {
    public:
        using AsioTcp = boost::asio::ip::tcp;
        using AsioTcpEndPoint = AsioTcp::endpoint;

        explicit TcpSocket(boost::asio::io_context& context) noexcept;

        ~TcpSocket() noexcept;

        void Send(const std::string& message_) noexcept override;

        /**
         *
         */
        void CleanErrors() noexcept;

        /**
         *
         */
        [[nodiscard]] bool TryToConnect() noexcept;

        /**
         *
         */
        void CloseConnection() noexcept;

        /**
         *
         * @param address
         * @return          ping success
         */
        [[nodiscard]] static bool CheckEndPoint(const std::string& address) noexcept;

    private:
        EndPoint _destinationEndPoint;

        EndPoint _sourceEndPoint;

        std::vector<boost::system::error_code> _errors;

        AsioTcp::socket _socket;

    public:
#pragma region Accessors

        [[nodiscard]] EndPoint GetDestinationEndPoint() const noexcept;

        [[nodiscard]] EndPoint GetSourceEndPoint() const noexcept;

        [[nodiscard]] std::string GetLastError() const noexcept;

        [[nodiscard]] const std::vector<boost::system::error_code>&
        GetErrors() const noexcept;

#pragma endregion Accessors

#pragma region Mutators

        EndPoint::Status SetDestinationEndPoint(EndPoint endPoint_) noexcept;

        EndPoint::Status SetSourceEndPoint(EndPoint endPoint_) noexcept;

#pragma endregion Mutators
    };
}
#endif
