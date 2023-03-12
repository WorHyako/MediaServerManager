#ifndef MEDIASERVERMANAGER_COMMAND_TEXTINFOCOMMAND_HPP
#define MEDIASERVERMANAGER_COMMAND_TEXTINFOCOMMAND_HPP

#include "command/ICommand.hpp"

#include <vector>
#include <string>

namespace MediaServerManager::Command {

    /**
     *
     */
    class TextInfoCommand : public ICommand {
    public:
        TextInfoCommand(pugi::xml_document command_, std::vector<std::string> text_) noexcept;

        void Execute() noexcept override;

    private:
        std::vector<std::string> _text;
    };
}

#endif
