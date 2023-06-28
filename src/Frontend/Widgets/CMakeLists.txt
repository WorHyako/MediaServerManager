qt_add_library(CustomWidgets STATIC)

file(GLOB QmlFiles RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.qml)

qt_add_qml_module(CustomWidgets
        VERSION 1.0
        URI Frontend.Widgets
        RESOURCE_PREFIX /WorHyako/MediaServerManager
        QML_FILES
            ${QmlFiles}
        DEPENDENCIES
            QtQuick
            QtQuick.Layouts
            QtQuick.Controls
            Frontend.Widgets
            Frontend.Backgrounds
            Frontend.Controls)
