cmake_minimum_required(VERSION 3.24)

qt_add_library(QmlCommands STATIC)

file(GLOB Files *.hpp *.cpp)

set(ModuleOutputDir ${CMAKE_CURRENT_BINARY_DIR})

qt_add_qml_module(QmlCommands
        VERSION 1.0
        URI Frontend.QmlObjects.Command
        RESOURCE_PREFIX /WorHyako/MediaServerManager
        OUTPUT_DIRECTORY ${ModuleOutputDir}
        SOURCES ${Files}
        DEPENDENCIES
        QtQuick
        QtQml)

target_include_directories(QmlCommands
        PUBLIC ${${PROJECT_NAME}_IncludeDir}
        PUBLIC ${worLib_Include_Dir})
