#ifndef MEDIASERVERMANAGER_COMMAND_COMMANDITEM_HPP
#define MEDIASERVERMANAGER_COMMAND_COMMANDITEM_HPP

#include <utility>
#include <string>

namespace MediaServerManager::Command {

    /**
     *
     */
    class CommandItem final {
    public:
        CommandItem() noexcept;

        CommandItem(std::string &&tag, std::string &&value) noexcept;

        std::pair<std::string, std::string> valuePair;
    };

    using CommandItemList = std::vector<CommandItem>;
}

#endif
