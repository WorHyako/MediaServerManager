#ifndef MEDIASERVERMANAGER_COMMAND_COMMANDBUILDER_HPP
#define MEDIASERVERMANAGER_COMMAND_COMMANDBUILDER_HPP

#include "Command/ActionCommand.hpp"

namespace MediaServerManager::Command {

    /**
     *
     */
    template<typename CommandType>
    class CommandBuilder {
    public:
        CommandBuilder() = delete;

        CommandBuilder(CommandBuilder&&) = delete;

        CommandBuilder(CommandBuilder&) = delete;

        ~CommandBuilder() = delete;

        CommandBuilder operator=(CommandBuilder&) = delete;

        CommandBuilder operator=(CommandBuilder&&) = delete;

        /**
         *
         * @return
         */
        static CommandType BuildCommand(const CommandItemList& commandItems);
    };

    template<typename CommandType>
    CommandType CommandBuilder<CommandType>::BuildCommand(const CommandItemList& commandItems) {
        if (!std::is_base_of_v<ActionCommand, CommandType>) {
            throw std::bad_cast();
        }
        CommandType command {};
        std::for_each(std::begin(commandItems), std::end(commandItems),
                      [&command](auto &each) {
                          command.AddItem(each);
                      });
        return command;
    }
}
#endif
