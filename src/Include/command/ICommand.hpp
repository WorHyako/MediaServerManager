#ifndef MEDIASERVERMANAGER_COMMAND_ICOMMAND_HPP
#define MEDIASERVERMANAGER_COMMAND_ICOMMAND_HPP

#include "pugixml.hpp"

#include "network/ISocket.hpp"

#include <memory>

namespace MediaServerManager::Command {

    enum BaseCommandFields {

    };

    /**
     *
     */
    class ICommand {
    public:
        ICommand() = default;

        ICommand(ICommand&&) = default;

        virtual ~ICommand() noexcept = default;

        virtual void Execute() noexcept = 0;

    protected:
        virtual void BuildCommand() noexcept = 0;

        pugi::xml_document _command;

        static std::unique_ptr<wor::network::ISocket> _sender;
    };
}
#endif
