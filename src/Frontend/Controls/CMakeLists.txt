qt_add_library(CustomControls STATIC)

file(GLOB QmlFiles RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.qml)

qt_add_qml_module(CustomControls
        VERSION 1.0
        URI Frontend.Controls
        RESOURCE_PREFIX /WorHyako/MediaServerManager
        QML_FILES
            ${QmlFiles}
        DEPENDENCIES
            QtQuick
            QtQuick.Layouts
            QtQuick.Controls
            Frontend.Backgrounds
            Frontend.Controls
            Frontend.Styles
            Frontend.Js)
