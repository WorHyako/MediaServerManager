#ifndef MEDIASERVERMANAGER_COMMAND_PLAYCOMMAND_HPP
#define MEDIASERVERMANAGER_COMMAND_PLAYCOMMAND_HPP

#include "command/ICommand.hpp"
#include "command/CommandBuilder.hpp"

namespace MediaServerManager::Command {

    /**
     *
     */
    class PlayCommand : public ICommand {
    public:
        explicit PlayCommand(pugi::xml_document commandText_) noexcept;

        void Execute() noexcept override;

    private:
        void BuildCommand() noexcept override;

        friend class CommandBuilder<PlayCommand>;
    };
}

#endif
