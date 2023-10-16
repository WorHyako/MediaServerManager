cmake_minimum_required(VERSION 3.24)

project(MediaServerManager
        VERSION 0.1
        LANGUAGES CXX)
set(CMAKE_CXX_COMPILER_VERSION 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#########################
### Project variables ###
#########################
set(${PROJECT_NAME}_IncludeDir ${CMAKE_CURRENT_SOURCE_DIR}/Include)
file(GLOB_RECURSE Sources Src/*.cpp)
file(GLOB Qt_Objects
        Include/ManagementScope.hpp
        Include/Json/JsonQmlWrapper.hpp
        Include/DynamicScopeType.hpp)

############################
### Third party packages ###
############################
find_package(SOCI 4.0.3 REQUIRED)
list(APPEND SOCI_LIBS soci_core)

set(CMAKE_AUTOMOC ON)
find_package(Qt6 COMPONENTS REQUIRED
        Core
        Qml
        Quick
        QuickControls2)

set(Boost_USE_MULTITHREADED ON)
set(Boost_NO_BOOST_CMAKE ON)
set(Boost_NO_WARN_NEW_VERSIONS ON)
find_package(Boost 1.81.0 REQUIRED COMPONENTS date_time)

add_subdirectory(ThirdParty/WorLibrary)

find_package(pugixml REQUIRED)

set(QML_IMPORT_TRACE ON)
set(QT_DECLARATIVE_DEBUG ON)
set(QT_QML_DEBUG ON)
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


target_sources(${PROJECT_NAME}
        PRIVATE ${Sources}
        PRIVATE ${Qt_Objects}
        PRIVATE ${WorLib_Vector}
        PRIVATE ${WorLib_Json}
        PRIVATE ${WorLib_Network})
message(WARNING ${WorLib_Network})
target_include_directories(${PROJECT_NAME}
        PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/Frontend
        PRIVATE ${${PROJECT_NAME}_IncludeDir}
        PRIVATE ${WorLib_Include_Dir}
        PRIVATE ${Boost_INCLUDE_DIRS})
target_link_libraries(${PROJECT_NAME}
        PRIVATE pugixml
        PRIVATE ${Boost_LIBRARIES}
#        PRIVATE ${SOCI_LIBS}
        PRIVATE Qt6::Quick
        PRIVATE Qt6::Qml
        PRIVATE Qt6::Core
        PRIVATE Qt6::QuickControls2
        PRIVATE ${QmlCustomPlugins})
