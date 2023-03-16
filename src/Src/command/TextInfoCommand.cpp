#include "command/TextInfoCommand.hpp"

using namespace MediaServerManager::Command;

void TextInfoCommand::Execute() noexcept {
//    _sender->Send();
}

TextInfoCommand::TextInfoCommand(pugi::xml_document command_, std::vector<std::string> text_) noexcept
        : _text(std::move(text_)) {
    _command = std::move(_command);
}
