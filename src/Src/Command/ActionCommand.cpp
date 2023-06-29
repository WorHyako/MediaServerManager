#include "Command/ActionCommand.hpp"

#include <iostream>
#include <sstream>

using namespace MediaServerManager::Command;

void ActionCommand::AddItem(CommandItem commandItem) noexcept {
    auto child = command.children().begin();
    auto attr = child->append_attribute(commandItem.valuePair.first.c_str());
    attr.set_name(commandItem.valuePair.first.c_str());
    attr.set_value(commandItem.valuePair.second.c_str());
    std::stringstream ss;
    command.print(ss);
    std::cout << "\nCommand created: " << ss.str();
}

ActionCommand::ActionCommand() noexcept {
    commandTag = "action";
    Command::MarkCommandTag();
}
