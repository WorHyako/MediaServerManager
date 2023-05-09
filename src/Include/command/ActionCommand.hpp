#ifndef MEDIASERVERMANAGER_COMMAND_HIDECOMMAND_HPP
#define MEDIASERVERMANAGER_COMMAND_HIDECOMMAND_HPP

#include "command/Command.hpp"

namespace MediaServerManager::Command {

    /**
     * 
     */
    class ActionCommand : public Command {
    public:
        ActionCommand() noexcept;

        ~ActionCommand() override = default;

        void AddItem(CommandItem commandItem) noexcept override;

        using Command::Execute;
    };
}

#endif
