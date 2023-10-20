cmake_minimum_required(VERSION 3.24)

add_subdirectory(Command)

add_subdirectory(Network)

list(APPEND QmlCustomObjectsPlugins QmlCommandsplugin QmlNetworkplugin)
set(QmlCustomObjectsPlugins ${QmlCustomObjectsPlugins} PARENT_SCOPE)
