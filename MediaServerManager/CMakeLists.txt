cmake_minimum_required(VERSION 3.24)

project(MediaServerManager
        VERSION 0.1
        LANGUAGES CXX)
set(CMAKE_CXX_COMPILER_VERSION 17)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(Qt6 COMPONENTS REQUIRED
        Core
        Qml
        Quick
        QuickControls2)

file(GLOB_RECURSE Sources Src/*.cpp)
file(GLOB_RECURSE Qml_Resources Frontend/*.qml)

set(Boost_USE_MULTITHREADED ON)
set(Boost_NO_BOOST_CMAKE ON)
find_package(Boost 1.81.0 REQUIRED COMPONENTS date_time)

add_subdirectory(ThirdParty/worLibrary)

find_package(pugixml REQUIRED)

add_executable(${PROJECT_NAME})

file(GLOB Qt_Objects
        Include/ManagementScope.hpp
        Include/json/JsonQmlWrapper.hpp
        Include/DynamicScopeType.hpp)
file(GLOB Qt_Resources Frontend/qt_resources.qrc)

target_sources(${PROJECT_NAME}
        PRIVATE ${Sources}
        PRIVATE ${Qt_Objects}
        PRIVATE ${Qt_Resources}
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
        PRIVATE Qt6::QuickControls2)
