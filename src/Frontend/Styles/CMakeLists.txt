qt_add_library(CustomStyles STATIC)

file(GLOB QmlFiles RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.qml)

set_source_files_properties(${QmlFiles} PROPERTIES
        QT_QML_SINGLETON_TYPE TRUE)

qt_add_qml_module(CustomStyles
        VERSION 1.0
        URI Frontend.Styles
        RESOURCE_PREFIX /WorHyako/MediaServerManager
        QML_FILES
            ${QmlFiles}
        DEPENDENCIES
            QtQuick)

