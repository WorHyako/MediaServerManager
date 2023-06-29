#include "Command/Command.hpp"

#include <sstream>
#include <iostream>

using namespace MediaServerManager::Command;

Command::Command(Command &rhs) noexcept {
    command.reset(rhs.command);
    std::copy(rhs.commandTag.begin(), rhs.commandTag.end(), commandTag.begin());
}

void Command::MarkCommandTag() noexcept {
    if (command.child(commandTag.c_str()).empty()) {
        auto child = command.append_child(commandTag.c_str());
    }
}

void Command::RemoveItem(const CommandItem& commandItem) noexcept {
    command.remove_attribute(commandItem.valuePair.first.c_str());
}

void Command::Clean() noexcept {
    command.reset();
}

void Command::Execute(Command::SocketRef sender) const noexcept {
    if (sender) {
        std::stringstream ss;
        command.print(ss);
        std::cout << "\npacket to send: " << ss.str();
        sender->Send(ss.str());
    }
}
