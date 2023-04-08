#ifndef MEDIASERVERMANAGER_COMMAND_HIDECOMMAND_HPP
#define MEDIASERVERMANAGER_COMMAND_HIDECOMMAND_HPP

#include "command/ICommand.hpp"
#include "command/CommandBuilder.hpp"

namespace MediaServerManager::Command {

    enum CommandFields {

    };

    /**
     * 
     */
    class HideCommand : public ICommand {
    public:
        HideCommand() noexcept;

        void Execute() noexcept override;

    private:
        void BuildCommand() noexcept override;

        friend class CommandBuilder<HideCommand>;
    };
}

#endif
