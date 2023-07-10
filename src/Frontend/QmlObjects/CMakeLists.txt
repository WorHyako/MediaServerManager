cmake_minimum_required(VERSION 3.24)

add_subdirectory(Command)

add_subdirectory(DataBase)

list(APPEND QmlCustomObjectsPlugins QmlDataBaseplugin QmlCommandsplugin)
set(QmlCustomObjectsPlugins ${QmlCustomObjectsPlugins} PARENT_SCOPE)
