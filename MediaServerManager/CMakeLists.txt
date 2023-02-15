cmake_minimum_required(VERSION 3.25)

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

add_executable(${PROJECT_NAME})
set_target_properties(${PROJECT_NAME} PROPERTIES
        WIN32_EXECUTABLE TRUE)

file(GLOB Qt_Objects Include/ManagementScope.hpp)
file(GLOB Qt_Resources Frontend/qt_resources.qrc)

set(Nlohmann_Inc_Dir "ThirdParty/json/single_include")

target_sources(${PROJECT_NAME}
        PRIVATE ${Sources}
        PRIVATE ${Qt_Objects}
        PRIVATE ${Qt_Resources})
target_include_directories(${PROJECT_NAME}
        PRIVATE Include
        PRIVATE ${Nlohmann_Inc_Dir})
target_link_libraries(${PROJECT_NAME}
        PRIVATE Qt6::Quick
        PRIVATE Qt6::Qml
        PRIVATE Qt6::Core
        PRIVATE Qt6::QuickControls2)
