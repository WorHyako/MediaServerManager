#include "command/PlayCommand.hpp"

using namespace MediaServerManager::Command;

void PlayCommand::Execute() noexcept {
//    _sender->Send();
}

PlayCommand::PlayCommand(pugi::xml_document commandText_) noexcept {
    _command = std::move(commandText_);
}
