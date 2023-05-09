#ifndef MEDIASERVERMANAGER_COMMAND_COMMANDPARSER_HPP
#define MEDIASERVERMANAGER_COMMAND_COMMANDPARSER_HPP

#include "command/Command.hpp"

namespace MediaServerManager::Command {

    /**
     *
     */
     template<typename CommandType>
    class CommandParser {
    public:
        CommandParser() = delete;

        ~CommandParser() = delete;

        static CommandType ParseCommand() noexcept;
    };
}
#endif
