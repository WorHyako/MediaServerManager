#ifndef MEDIASERVERMANAGER_COMMAND_ICOMMAND_HPP
#define MEDIASERVERMANAGER_COMMAND_ICOMMAND_HPP

#include "pugixml.hpp"

#include "Command/CommandItem.hpp"
#include "Network/ISocket.hpp"

#include <vector>
#include <memory>

namespace MediaServerManager::Command {

    /**
     *
     */
    class Command {
    protected:
        Command() noexcept = default;

        Command(Command &rhs) noexcept;

        virtual ~Command() = default;

        pugi::xml_document command;

        std::string commandTag;

        using SocketRef = wor::Network::ISocket *;

        virtual void Execute(SocketRef sender) const noexcept;

        virtual void AddItem(CommandItem commandItem) noexcept = 0;

        virtual void RemoveItem(const CommandItem& commandItem) noexcept;

        virtual void Clean() noexcept;

        virtual void MarkCommandTag() noexcept;
    };
}
#endif
