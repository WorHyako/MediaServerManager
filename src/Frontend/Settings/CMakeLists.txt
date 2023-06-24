qt_add_library(CustomSettings STATIC)

file(GLOB QmlFiles RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.qml)

qt_add_qml_module(CustomSettings
        VERSION 1.0
        URI Frontend.Settings
        RESOURCE_PREFIX /WorHyako/MediaServerManager
        QML_FILES
            ${QmlFiles}
        DEPENDENCIES
            QtQuick
            QtQuick.Layouts
            QtQuick.Controls
            Frontend.Controls
            Frontend.Backgrounds
            Frontend.Settings)
