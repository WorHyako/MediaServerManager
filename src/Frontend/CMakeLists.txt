cmake_minimum_required(VERSION 3.24)

set(QmlCustomPlugins)

##################################
### Custom qml objects modules ###
##################################
add_subdirectory(QmlObjects)

####################################################
### ,cmake file contains each module description ###
####################################################
include(ModuleDescriptions.cmake)

foreach (ModuleName ${Modules})
    set(TargetName Custom${ModuleName})
    set(ModuleUri Frontend.${ModuleName})
    set(ModuleOutputDir ${CMAKE_CURRENT_BINARY_DIR}/${ModuleName})

    set(Files "")
    foreach (EachFileExt ${${ModuleName}_FileExt})
        file(GLOB ExtFiles RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} ${ModuleName}/*${EachFileExt})
        list(APPEND Files ${ExtFiles})
    endforeach ()

    foreach (EachFile ${Files})
        file(RELATIVE_PATH FileName ${CMAKE_CURRENT_SOURCE_DIR}/${ModuleName} ${CMAKE_CURRENT_SOURCE_DIR}/${EachFile})
        set_source_files_properties(${EachFile} PROPERTIES
                QT_RESOURCE_ALIAS ${FileName})
    endforeach (EachFile)

    if ("${${ModuleName}_Type}" STREQUAL "Singleton")
        set_source_files_properties(${Files} PROPERTIES
                QT_QML_SINGLETON_TYPE TRUE)
    endif ()

    qt_add_library("${TargetName}" STATIC)
    qt_add_qml_module("${TargetName}"
            VERSION 1.0
            URI ${ModuleUri}
            RESOURCE_PREFIX /WorHyako/MediaServerManager
            OUTPUT_DIRECTORY ${ModuleOutputDir}
            QML_FILES ${Files}
            DEPENDENCIES ${${ModuleName}_Dependencies})
    list(APPEND QmlCustomPlugins
            ${TargetName}plugin)
endforeach (ModuleName)

######################################################
### Export plugins to parent CMakeLists to link it ###
######################################################
list(APPEND QmlCustomPlugins
        ${QmlCustomObjectsPlugins})
set(QmlCustomPlugins ${QmlCustomPlugins} PARENT_SCOPE)
