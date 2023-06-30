#ifndef MEDIASERVERMANAGER_JSON_ELEMENTCONFIG_HPP
#define MEDIASERVERMANAGER_JSON_ELEMENTCONFIG_HPP

#include <iostream>

#include "Vector/Vector2.hpp"

namespace MediaServerManager {

    /**
     * Object describe UI element state.\n
     * Use it to save/load config.
     */
    class ElementConfig {
    public:
        ElementConfig() = default;

        Wor::Vector::Vector2<int> size = { 1, 1 };
        Wor::Vector::Vector2<int> position = { 0, 0 };
        std::string name = "None";
        std::string id = "None";
    };
}
#endif
