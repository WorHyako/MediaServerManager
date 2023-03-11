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

add_definitions(-DWIN32_LEAN_AND_MEAN)
add_compile_definitions(_WIN32_WINNT=0x0A00)
# Set $Boost_ROOT environment variable to find boost directory
set(Boost_USE_MULTITHREADED ON)
set(Boost_USE_STATIC_RUNTIME OFF)
set(Boost_USE_STATIC_LIBS ON)
set(Boost_NO_BOOST_CMAKE ON)
set(BOOST_ROOT C:/bibles/boost/src)
find_package(Boost 1.81.0 REQUIRED COMPONENTS date_time)
message(STATUS "---------boost libs ${Boost_VERSION} ${Boost_LIBRARIES}")
add_subdirectory(ThirdParty/worLibrary)

add_executable(${PROJECT_NAME})
set_target_properties(${PROJECT_NAME} PROPERTIES
        WIN32_EXECUTABLE TRUE)

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
        PRIVATE ${worLib_Network}
        PRIVATE Include/network/EndPointChecker.hpp
        )
target_include_directories(${PROJECT_NAME}
        PRIVATE Include
        PRIVATE ${worLib_Include_Dir}
        PRIVATE ${Boost_INCLUDE_DIRS})
target_link_libraries(${PROJECT_NAME}
        PRIVATE ${Boost_LIBRARIES}
        PRIVATE Qt6::Quick
        PRIVATE Qt6::Qml
        PRIVATE Qt6::Core
        PRIVATE Qt6::QuickControls2
        ws2_32 iphlpapi.lib)
