#ifndef MEDIASERVERMANAGER_COMMAND_ICOMMAND_HPP
#define MEDIASERVERMANAGER_COMMAND_ICOMMAND_HPP

#include "pugixml.hpp"

#include "network/ISocket.hpp"

#include <memory>

namespace MediaServerManager::Command {

    /**
     *
     */
    class ICommand {
    public:
        virtual ~ICommand() noexcept = default;

        virtual void Execute() noexcept = 0;

    protected:
        pugi::xml_document _command;

        static std::unique_ptr<wor::network::ISocket> _sender;
    };
}

#endif
