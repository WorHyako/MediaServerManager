cmake_minimum_required(VERSION 3.24)

add_subdirectory(Command)
list(APPEND QmlCustomObjectsPlugins
        QmlCommandsplugin)

add_subdirectory(Network)
list(APPEND QmlCustomObjectsPlugins
        QmlNetworkplugin)

add_subdirectory(LiveData)
list(APPEND QmlCustomObjectsPlugins
        QmlLiveDataplugin)

set(QmlCustomObjectsPlugins ${QmlCustomObjectsPlugins} PARENT_SCOPE)
