qt_add_library(CustomBackgrounds STATIC)

file(GLOB QmlFiles RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.qml)

qt_add_qml_module(CustomBackgrounds
        VERSION 1.0
        URI Frontend.Backgrounds
        RESOURCE_PREFIX /WorHyako/MediaServerManager
        QML_FILES
            ${QmlFiles}
        DEPENDENCIES
            QtQuick
            QtQuick.Controls
            Frontend.Styles)
