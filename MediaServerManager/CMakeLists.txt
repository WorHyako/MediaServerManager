cmake_minimum_required(VERSION 3.16)

project(MediaServerManager VERSION 0.1 LANGUAGES CXX)
set(CMAKE_CXX_COMPILER_VERSION 17)

set(CMAKE_AUTOMOC ON)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(Qt6 6.2 COMPONENTS REQUIRED
        Core
        Qml
        Quick
        QuickControls2)
file(GLOB_RECURSE Sources Src/*.cpp)
file(GLOB_RECURSE Qml_Resources Frontend/*.qml)

add_executable(${PROJECT_NAME})
set_target_properties(${PROJECT_NAME} PROPERTIES
        WIN32_EXECUTABLE TRUE)

qt_add_resources(${PROJECT_NAME} "qml-files"
        PREFIX "/"
        FILES
        Frontend/main.qml
        Frontend/ListButtonsTexts.qml
        Frontend/ManagementButton.qml
        Frontend/EditTextField.qml
        Frontend/TextBackgroundRectangle.qml
        Frontend/ButtonBackgroundRectangle.qml
        Frontend/ControlTabs.qml
        Frontend/QuickButtons.qml
        Frontend/ManagementScope.qml
        Frontend/Styles/FontStyle.qml
        Frontend/Styles/ManagementButtonStyle.qml
        Frontend/Styles/TextEditStyle.qml
        Frontend/Assets/app_background.png)

file(GLOB Qt_Objects Include/ManagementScope.hpp)

set(Nlohmann_Inc_Dir "ThirdParty/json/single_include")

target_sources(${PROJECT_NAME}
        PRIVATE ${Sources}
        PRIVATE ${Qt_Objects})
target_include_directories(${PROJECT_NAME}
        PRIVATE Include
        PRIVATE ${Nlohmann_Inc_Dir})
target_link_libraries(${PROJECT_NAME}
        PRIVATE Qt6::Quick
        PRIVATE Qt6::Qml
        PRIVATE Qt6::Core
        PRIVATE Qt6::QuickControls2)

install(TARGETS ${PROJECT_NAME}
        BUNDLE DESTINATION .
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
