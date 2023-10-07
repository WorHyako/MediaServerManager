#pragma once

#include "Command/ActionCommand.hpp"

namespace MediaServerManager::Command {

    /**
     *
     */
    template<typename CommandType>
    class CommandParser {
    public:
        /*
         * Ctor.
         */
        CommandParser() = delete;

        /*
         * Dtor.
         */
        ~CommandParser() = delete;

        static CommandType ParseCommand() noexcept;
    };
}
