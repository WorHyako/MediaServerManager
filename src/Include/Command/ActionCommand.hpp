#pragma once

#include "pugixml.hpp"

#include "Command/ICommand.hpp"

#include <vector>
#include <memory>

namespace MediaServerManager::Command {

    /**
     *
     */
    class ActionCommand final : public ICommand {
    public:
        /**
         * Ctor
         */
        ActionCommand() noexcept;

        /*
         * Ctor
         */
        ActionCommand(ActionCommand &rhs) noexcept;

        /**
         * Dtor
         */
        ~ActionCommand() final = default;

        /**
         *
         * @param sender
         * @return
         */
        [[nodiscard]] bool Execute(SocketRef sender) const noexcept final;

        /**
         *
         * @param commandItem
         */
        void AddItem(const CommandItem &commandItem) noexcept;

        /**
         *
         * @param commandItem
         */
        void RemoveItem(const CommandItem &commandItem) noexcept;

        /**
         *
         */
        void Clean() noexcept final;

        /**
         *
         */
        void MarkCommandTag() noexcept final;

        /**
         *
         * @return
         */
        [[nodiscard]] std::string ToString() noexcept final;
    private:
        /**
         *
         */
        pugi::xml_document command;

        /**
         *
         */
        std::string commandTag;
    };
}
