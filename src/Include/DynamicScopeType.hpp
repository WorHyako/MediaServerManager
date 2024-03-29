#pragma once

#include <QObject>

namespace MediaServerManager {
    /**
     *  Enum wrapper for QML accessing\n
     *  Enum describe all types of dynamic scopes
     */
    class DynamicScopeType {
    Q_GADGET
    public:
        DynamicScopeType() = default;

        enum Value {
            QuickButtons,
            ManagementButtons,
            QuickTitles,
            All
        };

        Q_ENUM(Value)
    };
}
