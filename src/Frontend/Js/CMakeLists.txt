qt_add_library(JsLibrary STATIC)

file(GLOB JsFiles RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.js)

qt_add_qml_module(JsLibrary
        VERSION 1.0
        URI Frontend.Js
        RESOURCE_PREFIX /WorHyako/MediaServerManager
        QML_FILES
            ${JsFiles}
        DEPENDENCIES
            QtQuick)
