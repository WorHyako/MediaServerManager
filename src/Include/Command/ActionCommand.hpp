#pragma once

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
        /**
         * Ctor.
         */
        ActionCommand() noexcept;

        /*
         * Ctor.
         */
        ActionCommand(ActionCommand &rhs) noexcept;

        /**
         * Dtor.
         */
        ~ActionCommand() final = default;

        [[nodiscard]] bool Execute(SocketRef sender) const noexcept final;

        void AddItem(const CommandItem &commandItem) noexcept;

        void RemoveItem(const CommandItem &commandItem) noexcept;

        void Clean() noexcept final;

        void MarkCommandTag() noexcept final;

        [[nodiscard]] std::string ToString() noexcept final;
    private:
        pugi::xml_document command;

        std::string commandTag;
    };
}
