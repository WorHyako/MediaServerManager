#include "Command/ActionCommand.hpp"

#include "Network/SocketManager.hpp"

#include <sstream>
#include <iostream>

using namespace MediaServerManager::Command;

ActionCommand::ActionCommand() noexcept :
        commandTag("action") {
    MarkCommandTag();
}

ActionCommand::ActionCommand(ActionCommand &rhs) noexcept {
    command.reset(rhs.command);
    std::copy(std::begin(rhs.commandTag), std::end(rhs.commandTag), std::begin(commandTag));
}

void ActionCommand::MarkCommandTag() noexcept {
    if (command.child(commandTag.c_str()).empty()) {
        auto child = command.append_child(commandTag.c_str());
    }
}

void ActionCommand::RemoveItem(const CommandItem &commandItem) noexcept {
    command.remove_attribute(commandItem.valuePair.first.c_str());
}

void ActionCommand::Clean() noexcept {
    command.reset();
}

bool ActionCommand::Execute(ICommand::SocketRef sender) const noexcept {
    if (sender->Status() != Wor::Network::SocketStatus::Connected) {
        return false;
    }
    std::stringstream ss;
    command.print(ss);
    std::cout << "\npacket to send: " << ss.str();
    return sender->Send(ss.str()) > 0;
}

void ActionCommand::AddItem(const CommandItem& commandItem) noexcept {
    auto child = std::begin(command.children());
    auto attr = child->append_attribute(commandItem.valuePair.first.c_str());
    attr.set_name(commandItem.valuePair.first.c_str());
    attr.set_value(commandItem.valuePair.second.c_str());
    std::stringstream ss;
    command.print(ss);
    std::cout << "\nCommand created: " << ss.str();
}
