#ifndef MEDIASERVERMANAGER_COMMAND_INFOCOMMAND_HPP
#define MEDIASERVERMANAGER_COMMAND_INFOCOMMAND_HPP

#include "Command/Command.hpp"

namespace MediaServerManager::Command {

    class InfoCommand : private Command {
    public:
        InfoCommand() noexcept;

        ~InfoCommand() override = default;

        void AddItem(CommandItem commandItem) noexcept override;
    };
}

#endif
