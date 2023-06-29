#ifndef MEDIASERVERMANAGER_COMMAND_COMMANDBUILDER_HPP
#define MEDIASERVERMANAGER_COMMAND_COMMANDBUILDER_HPP

#include "Command/Command.hpp"

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
        static CommandType BuildCommand(CommandItemList commandItems) noexcept;
    };

    template<typename CommandType>
    CommandType CommandBuilder<CommandType>::BuildCommand(
            CommandItemList commandItems) noexcept {
        if (!std::is_base_of_v<Command, CommandType>) {
            throw std::bad_cast();
        }
        CommandType command {};
        std::for_each(commandItems.begin(), commandItems.end(),
                      [&command](auto &each) {
                          command.AddItem(each);
                      });
        return command;
    }
}
#endif
