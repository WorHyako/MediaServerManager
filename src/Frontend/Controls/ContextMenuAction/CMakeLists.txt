cmake_minimum_required(VERSION 3.24)

qt_add_library(ContextMenuAction STATIC)

set(ModuleOutputDir ${CMAKE_CURRENT_BINARY_DIR})

file(GLOB Files RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.qml)

qt_add_qml_module(ContextMenuAction
        VERSION 1.0
        URI Frontend.Controls.ContextMenuAction
        RESOURCE_PREFIX /WorHyako/MediaServerManager
        OUTPUT_DIRECTORY ${ModuleOutputDir}
        QML_FILES ${Files}
        DEPENDENCIES
        QtQuick
        QtQml
        Frontend.Js)

target_include_directories(ContextMenuAction
        PUBLIC ${${PROJECT_NAME}_IncludeDir}
        PUBLIC ${worLib_Include_Dir})
