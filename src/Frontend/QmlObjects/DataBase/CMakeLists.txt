cmake_minimum_required(VERSION 3.24)

file(GLOB Files *.hpp *.cpp)
set(ModuleOutputDir ${CMAKE_CURRENT_BINARY_DIR})

qt_add_library(QmlDataBase STATIC)
target_sources(QmlDataBase PUBLIC ${Files})

qt_add_qml_module(QmlDataBase
        VERSION 1.0
        URI Frontend.QmlObjects.DataBase
        RESOURCE_PREFIX /WorHyako/MediaServerManager
        OUTPUT_DIRECTORY ${ModuleOutputDir}
        SOURCES ${Files}
        DEPENDENCIES
        QtQuick
        QtQml)

target_include_directories(QmlDataBase
        PUBLIC ${${PROJECT_NAME}_IncludeDir}
        PUBLIC ${worLib_Include_Dir})
