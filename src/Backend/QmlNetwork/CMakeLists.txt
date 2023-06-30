qt_add_library(QmlNetwork STATIC)

file(GLOB Files *.*pp)

target_sources(QmlNetwork PUBLIC ${Files})
set(ModuleOutputDir ${CMAKE_CURRENT_BINARY_DIR})

qt_add_qml_module(QmlNetwork
        VERSION 1.0
        URI Backend.QmlNetwork
        RESOURCE_PREFIX /WorHyako/MediaServerManager
        OUTPUT_DIRECTORY ${ModuleOutputDir}
        SOURCES ${Files}
        DEPENDENCIES
        QtQuick
        QtQml)

target_include_directories(QmlNetwork
        PUBLIC ../../Include
        PUBLIC ${worLib_Include_Dir})
