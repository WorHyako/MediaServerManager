#ifndef MEDIASERVERMANAGER_COMMAND_COMMANDBUILDER_HPP
#define MEDIASERVERMANAGER_COMMAND_COMMANDBUILDER_HPP

#include "command/ICommand.hpp"

#include <iostream>

namespace MediaServerManager::Command {

    /**
     *
     */
    template<typename CommandType>
    class CommandBuilder {
    public:
        CommandBuilder() = delete;

        ~CommandBuilder() = delete;

        /**
         *
         * @return
         */
        static CommandType BuildCommand(const std::string& args...) noexcept;
    };

    template<typename CommandType>
    CommandType CommandBuilder<CommandType>::BuildCommand(const std::string& args...) noexcept {
        if(!std::is_base_of_v<ICommand, CommandType>) {
            throw std::bad_cast();
        }
        auto command = CommandType();
        command.BuildCommand();
        return command;
    }
}
#endif
