qt_add_library(BackFol STATIC)

file(GLOB Files *.*pp)

target_sources(BackFol PUBLIC ${Files})
set(ModuleOutputDir ${CMAKE_CURRENT_BINARY_DIR}/Backend)

qt_add_qml_module(BackFol
        VERSION 1.0
        URI Backend.BackFol
        RESOURCE_PREFIX /WorHyako/MediaServerManager
        OUTPUT_DIRECTORY ${ModuleOutputDir}/BackFol
        SOURCES ${Files}
        DEPENDENCIES
        QtQuick
        QtQml)
