cmake_minimum_required(VERSION 3.24)

project(MediaServerManager
        VERSION 0.1
        LANGUAGES CXX)
set(CMAKE_CXX_COMPILER_VERSION 17)

set(CMAKE_AUTOMOC ON)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
#set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(Qt6 COMPONENTS REQUIRED
        Core
        Qml
        Quick
        QuickControls2)

file(GLOB_RECURSE Sources Src/*.cpp)

set(Boost_USE_MULTITHREADED ON)
set(Boost_NO_BOOST_CMAKE ON)
set(Boost_NO_WARN_NEW_VERSIONS ON)
find_package(Boost 1.81.0 REQUIRED COMPONENTS date_time)

add_subdirectory(ThirdParty/worLibrary)

find_package(pugixml REQUIRED)

qt_add_executable(${PROJECT_NAME} main.cpp)

set_target_properties(${PROJECT_NAME} PROPERTIES
        AUTOMOC ON)

qt_add_qml_module(MediaServerManager
        VERSION 1.0
        URI Frontend
        RESOURCE_PREFIX /worHyako/MediaServerManager
        QML_FILES
            main.qml)

file(GLOB Qt_Objects
        Include/ManagementScope.hpp
        Include/json/JsonQmlWrapper.hpp
        Include/DynamicScopeType.hpp)

add_subdirectory(Frontend)

target_sources(${PROJECT_NAME}
        PRIVATE ${Sources}
        PRIVATE ${Qt_Objects}
        PRIVATE ${worLib_Vector}
        PRIVATE ${worLib_Json}
        PRIVATE ${worLib_Network})
target_include_directories(${PROJECT_NAME}
        PRIVATE Include
        PRIVATE ${worLib_Include_Dir}
        PRIVATE ${Boost_INCLUDE_DIRS})
target_link_libraries(${PROJECT_NAME}
        PRIVATE pugixml
        PRIVATE ${Boost_LIBRARIES}
        PRIVATE Qt6::Quick
        PRIVATE Qt6::Qml
        PRIVATE Qt6::Core
        PRIVATE Qt6::QuickControls2
        PRIVATE CustomControlsplugin
        PRIVATE CustomStylesplugin
        PRIVATE JsLibraryplugin
        PRIVATE CustomWidgetsplugin
        PRIVATE CustomBackgroundsplugin
        PRIVATE CustomSettingsplugin)