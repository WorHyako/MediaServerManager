#pragma once

#include <utility>
#include <string>

namespace MediaServerManager::Command {

    /**
     *
     */
    class CommandItem final {
    public:
        /*
         * Ctor.
         */
        CommandItem() noexcept;

        /**
         * Ctor with pair initialization
         * @param tag   command tag
         * @param value command value
         */
        CommandItem(std::string &&tag, std::string &&value) noexcept;

        std::pair<std::string, std::string> valuePair;
    };

    using CommandItemList = std::vector<CommandItem>;
}
