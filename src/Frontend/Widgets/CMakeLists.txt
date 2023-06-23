qt_add_library(CustomWidgets STATIC)

qt_add_qml_module(CustomWidgets
        VERSION 1.0
        URI Frontend.Widgets
        RESOURCE_PREFIX /WorHyako/MediaServerManager
        QML_FILES
            ControlTabs.qml
            ManagementScope.qml
            QuickButtonsScope.qml
            QuickTitleScope.qml
            RenamingDialog.qml
            Table.qml
        DEPENDENCIES
            QtQuick
            QtQuick.Layouts
            QtQuick.Controls
            Frontend.Widgets
            Frontend.Backgrounds
            Frontend.Controls)
