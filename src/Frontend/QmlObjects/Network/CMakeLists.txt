cmake_minimum_required(VERSION 3.24)

file(GLOB Files *.hpp *.cpp)
set(ModuleOutputDir ${CMAKE_CURRENT_BINARY_DIR})

qt_add_library(QmlNetwork STATIC)
target_sources(QmlNetwork PUBLIC ${Files})

qt_add_qml_module(QmlNetwork
        VERSION 1.0
        URI Frontend.QmlObjects.Network
        RESOURCE_PREFIX /WorHyako/MediaServerManager
        OUTPUT_DIRECTORY ${ModuleOutputDir}
        SOURCES ${Files}
        DEPENDENCIES
        QtQuick
        QtQml)

target_include_directories(QmlNetwork
        PUBLIC
        ${${PROJECT_NAME}_IncludeDir}
        ${WorLib_Include_Dir})
