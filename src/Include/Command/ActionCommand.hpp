#ifndef MEDIASERVERMANAGER_COMMAND_ICOMMAND_HPP
#define MEDIASERVERMANAGER_COMMAND_ICOMMAND_HPP

#include "pugixml.hpp"

#include "Command/ICommand.hpp"
#include "Network/ISocket.hpp"

#include <vector>
#include <memory>

namespace MediaServerManager::Command {

    /**
     *
     */
    class ActionCommand final : public ICommand {
    public:
        ActionCommand() noexcept;

        ActionCommand(ActionCommand &rhs) noexcept;

        ~ActionCommand() final = default;

        [[nodiscard]] bool Execute(SocketRef sender) const noexcept final;

        void AddItem(const CommandItem& commandItem) noexcept;

        void RemoveItem(const CommandItem& commandItem) noexcept;

        void Clean() noexcept final;

        void MarkCommandTag() noexcept final;

    private:
        pugi::xml_document command;

        std::string commandTag;
    };
}
#endif
