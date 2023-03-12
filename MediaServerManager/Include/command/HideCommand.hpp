#ifndef MEDIASERVERMANAGER_COMMAND_HIDECOMMAND_HPP
#define MEDIASERVERMANAGER_COMMAND_HIDECOMMAND_HPP

#include "command/ICommand.hpp"

namespace MediaServerManager::Command {

    /**
     * 
     */
    class HideCommand : public ICommand {
    public:
        HideCommand() noexcept;

        void Execute() noexcept override;
    };
}

#endif
