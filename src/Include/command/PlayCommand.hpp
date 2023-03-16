#ifndef MEDIASERVERMANAGER_COMMAND_PLAYCOMMAND_HPP
#define MEDIASERVERMANAGER_COMMAND_PLAYCOMMAND_HPP

#include "command/ICommand.hpp"

namespace MediaServerManager::Command {

    /**
     *
     */
    class PlayCommand : public ICommand {
    public:
        explicit PlayCommand(pugi::xml_document commandText_) noexcept;

        void Execute() noexcept override;
    };
}

#endif
