#include "network/TcpSocket.hpp"

#include "network/EndPointChecker.hpp"

using namespace wor::network;

TcpSocket::TcpSocket(boost::asio::io_context& context) noexcept
        : _socket(context) {
}

TcpSocket::~TcpSocket() noexcept {
    CloseConnection();
}

void TcpSocket::CleanErrors() noexcept {
    _errors.clear();
}

bool TcpSocket::TryToConnect() noexcept {
    try {
        _socket.connect(AsioTcpEndPoint(boost::asio::ip::address::from_string(_destinationEndPoint.address.c_str()),
                                        _destinationEndPoint.port));
    } catch (std::exception& e) {
        /// Temporary. Just for debug in development
        std::string errorMessage = e.what();
        return false;
    }
    return true;
}

void TcpSocket::CloseConnection() noexcept {
    if (_socket.is_open()) {
        _socket.close();
    }
}

bool TcpSocket::CheckEndPoint(const std::string& address) noexcept {
    return wor::network::utils::checkEndPoint(address);
}

#pragma region Accessors

EndPoint TcpSocket::GetDestinationEndPoint() const noexcept {
    return _destinationEndPoint;
}

EndPoint TcpSocket::GetSourceEndPoint() const noexcept {
    return _sourceEndPoint;
}

std::string TcpSocket::GetLastError() const noexcept {
    return _errors.back().message();
}

const std::vector<boost::system::error_code>& TcpSocket::GetErrors() const noexcept {
    return _errors;
}

#pragma endregion Accessors

#pragma region Mutators

EndPoint::Status TcpSocket::SetDestinationEndPoint(EndPoint endPoint_) noexcept {
    _destinationEndPoint = std::move(endPoint_);
    return _destinationEndPoint.status;
}

EndPoint::Status TcpSocket::SetSourceEndPoint(EndPoint endPoint_) noexcept {
    _sourceEndPoint = std::move(endPoint_);
    return _sourceEndPoint.status;
}

#pragma endregion Mutators