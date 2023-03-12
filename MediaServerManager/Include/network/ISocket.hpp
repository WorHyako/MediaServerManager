#ifndef WORLIBRARY_NETWORK_ISOCKET_HPP
#define WORLIBRARY_NETWORK_ISOCKET_HPP

namespace wor::network {

    /**
     *
     */
    class ISocket {
    public:
        virtual ~ISocket() = default;

        virtual void Send(const std::string& message_) noexcept = 0;
    };
}

#endif
