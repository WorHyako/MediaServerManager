set(QmlCustomPlugins)

include(ModuleDescriptions.cmake)

foreach (Module ${Modules})
    set(ModuleName Custom${Module})
    set(ModuleUri Frontend.${Module})
    set(ModuleOutputDir ${CMAKE_CURRENT_BINARY_DIR}/${Module})

    file(GLOB Files RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} ${Module}/*${${Module}_FileExt})

    qt_add_library("${ModuleName}" STATIC)

    if ("${${Module}_Type}" STREQUAL "Singleton")
        set_source_files_properties(${Files} PROPERTIES
                QT_QML_SINGLETON_TYPE TRUE)
    endif ()
    qt_add_qml_module("${ModuleName}"
            VERSION 1.0
            URI ${ModuleUri}
            RESOURCE_PREFIX /WorHyako/MediaServerManager
            OUTPUT_DIRECTORY ${ModuleOutputDir}
            QML_FILES ${Files}
            DEPENDENCIES ${${Module}_Dependencies})
    list(APPEND QmlCustomPlugins ${ModuleName}plugin)
endforeach (Module)

set(QmlCustomPlugins ${QmlCustomPlugins} PARENT_SCOPE)
