cmake_minimum_required(VERSION 3.24)

qt_add_library(QmlLiveData STATIC)

file(GLOB Files *.hpp *.cpp)

set(ModuleOutputDir ${CMAKE_CURRENT_BINARY_DIR})

qt_add_qml_module(QmlLiveData
        VERSION 1.0
        URI Frontend.QmlObjects.LiveData
        RESOURCE_PREFIX /WorHyako/MediaServerManager
        OUTPUT_DIRECTORY ${ModuleOutputDir}
        SOURCES ${Files}
        DEPENDENCIES
        QtQuick
        QtQml)

target_include_directories(QmlLiveData
        PUBLIC ${${PROJECT_NAME}_IncludeDir}
        PUBLIC ${WorLib_Include_Dir}
        PUBLIC ${Utils_Include_Dir})
