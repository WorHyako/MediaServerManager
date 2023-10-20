#pragma once

#include "WorLibrary/Network/ISocket.hpp"
#include "Command/CommandItem.hpp"

#include <string>

namespace MediaServerManager::Command {

    /*
     * Interface to all command classes
     */
    class ICommand {
    public:
        /*
         * Dtor.
         */
        virtual ~ICommand() = default;

        using SocketRef = std::shared_ptr<Wor::Network::ISocket>;

        /**
         *
         * @param sender
         * @return
         */
        [[nodiscard]] virtual bool Execute(SocketRef sender) const noexcept = 0;

        /**
         *
         */
        virtual void Clean() noexcept = 0;

        /**
         *
         */
        virtual void MarkCommandTag() noexcept = 0;

        /**
         *
         * @return
         */
        [[nodiscard]] virtual std::string ToString() noexcept = 0;
    };
}
