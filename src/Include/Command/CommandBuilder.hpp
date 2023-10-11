#pragma once

#include "Command/ActionCommand.hpp"

namespace MediaServerManager::Command {

    /**
     *
     */
    template<typename CommandType>
    class CommandBuilder {
    public:
        /*
         * Ctor.
         */
        CommandBuilder() = delete;

        /*
         * Ctor.
         */
        CommandBuilder(CommandBuilder&&) = delete;

        /*
         * Ctor.
         */
        CommandBuilder(CommandBuilder&) = delete;

        /*
         * Dtor.
         */
        ~CommandBuilder() = delete;

        /*
         * Copy operator
         */
        CommandBuilder operator=(CommandBuilder&) = delete;

        /*
         * Move operator
         */
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
