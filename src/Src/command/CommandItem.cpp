#include "command/CommandItem.hpp"

using namespace MediaServerManager::Command;

CommandItem::CommandItem() noexcept : valuePair(std::pair("", "")) {}

CommandItem::CommandItem(std::string &&tag, std::string &&value) noexcept :
        valuePair { tag, value } {}
