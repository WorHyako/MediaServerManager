cmake_minimum_required(VERSION 3.24)

project(MediaServerManager
        VERSION 0.1
        LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#########################
### Project variables ###
#########################
set(${PROJECT_NAME}_IncludeDir ${CMAKE_CURRENT_SOURCE_DIR}/Include)
file(GLOB_RECURSE Sources Src/*.cpp)
file(GLOB Qt_Objects
        Include/ManagementScope.hpp
        Include/Json/JsonQmlWrapper.hpp
        Include/LiveData/QmlLiveDataTracker.hpp
        Include/DynamicScopeType.hpp)

########################
### Third Party libs ###
########################
set(WORLIBRARY_JSON ON)
set(WORLIBRARY_DATA_CONVERTER ON)
set(WORLIBRARY_SQL ON)
set(WORLIBRARY_MATH ON)
set(WORLIBRARY_NETWORK ON)
set(WORLIBRARY_CURRENCY ON)
set(WorLibrary_Root_Dir ${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty/WorLibrary)
add_subdirectory(${WorLibrary_Root_Dir})

set(Utils_Root_Dir ${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty/Utils)
add_subdirectory(${Utils_Root_Dir})

set(CMAKE_AUTOMOC ON)
set(QML_IMPORT_TRACE ON)
set(QT_DECLARATIVE_DEBUG ON)
set(QT_QML_DEBUG ON)
find_package(Qt6 COMPONENTS REQUIRED
        Core
        Qml
        Quick
        QuickControls2)
list(APPEND Qt_Libs
        Qt6::Quick
        Qt6::Qml
        Qt6::Core
        Qt6::QuickControls2)

find_package(pugixml REQUIRED)

qt_add_executable(${PROJECT_NAME} main.cpp)

##############################
### Main QML target module ###
##############################
qt_add_qml_module(MediaServerManager
        VERSION 1.0
        URI Frontend
        RESOURCE_PREFIX /WorHyako/MediaServerManager
        QML_FILES main.qml
        DEPENDENCIES
        QtQuick
        QtQuick.Controls
        QtQuick.Layouts
        Frontend.Controls
        Frontend.Widgets
        Frontend.Js)
qt_add_resources(MediaServerManager
        PREFIX "/"
        FILES Frontend/Assets/app-background.png)

######################################
### Directory with all GUI modules ###
######################################
add_subdirectory(Frontend)

##########################################
### Collect all properties for project ###
##########################################
target_sources(${PROJECT_NAME}
        PRIVATE
        ${Sources}
        ${Qt_Objects}
        ${Utils_Sources}
        ${Utils_Src})
target_include_directories(${PROJECT_NAME}
        PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/Frontend
        ${${PROJECT_NAME}_IncludeDir}
        ${Soci_Include_Dir}
        ${Utils_Include_Dir})
target_link_directories(${PROJECT_NAME}
        PRIVATE
        ${Soci_Libs_Dir})
target_link_libraries(${PROJECT_NAME}
        PRIVATE
        pugixml
        ${Qt_Libs}
        ${Soci_Libs}
        WorLibrary
        ${QmlCustomPlugins})
