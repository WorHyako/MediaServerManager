#include "network/EndPoint.hpp"

using namespace wor::network;

EndPoint::EndPoint(std::string address_, int port_) noexcept
        : address(std::move(address_)),
          port(port_),
          status(Status::ZeroCheck) {
}
