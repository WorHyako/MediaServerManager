qt_add_library(CustomSettings STATIC)

qt_add_qml_module(CustomSettings
        VERSION 1.0
        URI Frontend.Settings
        RESOURCE_PREFIX /WorHyako/MediaServerManager
        QML_FILES
            MidiSettings.qml
            SettingsWindow.qml
            NetworkSettings.qml
        DEPENDENCIES
            QtQuick
            QtQuick.Layouts
            QtQuick.Controls
            Frontend.Controls
            Frontend.Backgrounds
            Frontend.Settings)
